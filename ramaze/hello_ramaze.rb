require 'ramaze'

class MyController < Ramaze::Controller
  map '/'

  def index
    return "Hello, Ramaze!"
  end
end

Ramaze.start