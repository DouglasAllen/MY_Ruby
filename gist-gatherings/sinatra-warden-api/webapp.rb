require 'sinatra'

class WebApp < Sinatra::Base
  get '/' do
    'Hello ditty!'
  end
end
