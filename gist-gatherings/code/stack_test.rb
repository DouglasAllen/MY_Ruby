require File.expand_path '../test-helper.rb', __FILE__

OUTER_APP = Rack::Builder.parse_file('config.ru').first

class TestApp < Test::Unit::TestCase
 include Rack::Test::Methods

 def app
  OUTER_APP
 end

 def test_root
   get '/'
   assert last_response.ok?
 end
 
 def test_erb
   get '/erb'
   assert last_response.ok?
 end
 
end