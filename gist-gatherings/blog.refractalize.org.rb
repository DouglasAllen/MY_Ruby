=begin
http://blog.refractalize.org/post/3141970594/warden-and-sinatra
refractalize!

    Home

refractalize / posted on 6 February 2011
Warden and Sinatra

There’s not a huge amount of documentation for using Warden with Sinatra in Ruby. 
Here’s a sample app that may answer a few questions. 
Particularly changes to the use of the Failure app, which used to call /unauthenticated but now
calls the URL that was accessed by the user - causing a recursive call if the failure app is 
the same as the host app.

=end


class LoginManager < Sinatra::Base

  @error_style = false
  @login_greeting = "not logged in"

  set :root, File.dirname(__FILE__)

  enable :sessions
  enable :inline_templates
  
  register Warden
  #register Sinatra::Warden
  Warden::Manager.serialize_into_session{|id| id }
  Warden::Manager.serialize_from_session{|id| id }
  
  #use Rack::Session::Cookie
  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = FailureApp.new
  end
   
  def call(env)
    puts 'manager: ' + env['REQUEST_METHOD'] + ' ' + env['REQUEST_URI']
    super
  end
   
  Warden::Strategies.add(:password) do
  
    def valid?
      puts 'password strategy valid?'
      username = params["username"]
      username and username != ''
    end
   
    def authenticate!
      puts 'password strategy authenticate'
      username = params["username"]
      if ['tim', 'rach'].include?(username)
        success!(username)
      else
        fail!('could not login')
      end
    end
    
  end
  
  def login(error_style)
    if error_style == false
      'style="background: red"'
    else
      ''
    end
  end
  
  get "/" do
    if env['warden'].authenticated?
      @login_greeting = "welcome #{env['warden'].user}!"
    else
      @login_greeting = "not logged in"
    end
    erb :home
  end

  post '/unauthenticated/?' do
    status 401
    login
  end
 
  get '/login/?' do
    unless @error_style == true
      'style=""'
    else
      'style="background: red"'
    end
    erb :form 
  end

  get '/protected' do
    env['warden'].authenticate!
    'this is protected'
  end
  
  post '/login/?' do
    if env['warden'].authenticate
      redirect "/protected"
    else
      login(true)
      "user not authorized"
    end
  end
  
  get '/logout/?' do
    env['warden'].logout
    redirect '/'
  end

  get '/error' do
      uri = params['uri']
      %$login error trying to access <a href="#{uri}">#{uri}</a>. Go <a href="/">home</a> instead.$
  end  
end

class FailureApp
  def call(env)
      uri = env['REQUEST_URI']
    puts 'failure: ' + env['REQUEST_METHOD'] + ' ' + uri
    [302, {'Location' => '/error?uri=' + CGI::escape(uri)}, '']
  end
end

__END__
@@form
<html><body>
<form action=/login method=post>
username <input name=username type=text #{LoginManager.error_style}/>
</form></body></html>
@@home
<html><body>
<%= "#{@login_greeting}" %>
<ul>
<li><a href="/login">login</a></li>
<li><a href="/logout">logout</a></li>
<li><a href="/protected">protected</a></li>
</ul>
</body></html>
