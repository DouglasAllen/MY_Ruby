require 'bundler'
#Bundler.require
Bundler.setup

class TryThis < Sinatra::Base

  set :root, File.dirname(__FILE__)

  enable :sessions

  use Rack::Session::Cookie

  get "/" do
    "Ditty on"
    env.sort.map {|k, v| "#{k}=>#{v}</br>"}
  end
end
