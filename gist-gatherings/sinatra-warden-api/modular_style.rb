########
# app.rb
#

require 'sinatra/base'

class SimpleApp < Sinatra::Base

  set :root, File.dirname(__FILE__)

  enable :sessions
  enable :inline_templates

  def require_logged_in
    redirect('/sessions/new') unless is_authenticated?
  end

  def is_authenticated?
    return !!session[:user_id]
  end

  get '/' do
    erb :form
  end

  get '/sessions/new' do
    erb :login
  end

  post '/sessions' do
    session[:user_id] = params["user_id"]
  end

  get '/secrets' do
    require_logged_in
    erb :secrets
  end

end

__END__
@@form
<form action=/try_this method=get>
username <input name=username type=text />
</form>