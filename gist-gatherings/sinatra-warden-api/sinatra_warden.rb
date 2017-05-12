class MyApplication < Sinatra::Base

  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = MyApplication
  end

  Warden::Manager.serialize_into_session{ |user| user.id }
  Warden::Manager.serialize_from_session{ |id| User.find(id) }

  Warden::Manager.before_failure do |env,opts|
    # Sinatra can be picky about the method used to authenticate
    # so to be sure everything works, let's specify it here.
    env['REQUEST_METHOD'] = "POST"
  end

  Warden::Strategies.add(:password) do
    def valid?
      params["email"] || params["password"]
    end

    def authenticate!
      u = User.authenticate(params["email"], params["password"])
      u.nil? ? fail!("Could not log in") : success!(u)
    end
  end

  def warden_handler
    env['warden']
  end

  def check_authentication
    unless warden_handler.authenticated?
      session[:crumb_path] = env['PATH_INFO']
      redirect '/login'
    end
  end

  def current_user
    warden_handler.user
  end

  not_found do
    "Uh, 404. It seems that we can't find what you're looking for."
  end

  error do
    "Something that shouldn't have occurred did."
  end

  get '/logout' do
    warden_handler.logout
    redirect '/admin'
  end

  get '/login' do
    erb :form
  end

  post '/session' do
    warden_handler.authenticate!
    if warden_handler.authenticated?
      redirect session[:crumb_path]
    else
      redirect '/login'
    end
  end
end