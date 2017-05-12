require 'sinatra'

get '/' do
  "Hello World #{params[:name]}".strip
end

get '/erb' do
  
end