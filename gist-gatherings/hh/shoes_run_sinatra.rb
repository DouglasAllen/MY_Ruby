require 'green_shoes'
require 'sinatra'

Shoes.app do

  system ''

  get '/' do
    "Hello world!"
  end

end

