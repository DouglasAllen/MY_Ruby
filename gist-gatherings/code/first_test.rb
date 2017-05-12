ENV['RACK_ENV'] = 'test'
require 'test/unit'
require 'rack/test'


require File.expand_path '../my-app.rb', __FILE__

class RoutesTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app() Sinatra::Application end

  def test_homepage
    get '/'
    assert last_response.ok?
  end  
  
  def test_erb
    get '/erb'
    assert last_response.ok?
  end
  
end