require File.expand_path '../test-helper.rb', __FILE__

class ExampleUnitTest < Test::Unit::TestCase

  include Rack::Test::Methods

  def app() Sinatra::Application end

  context "view my page" do
    setup do
      get '/'
    end

    should "greet the visitor" do
      assert last_response.ok?
      assert_equal 'Welcome to my page!', last_response.body
    end

  end
end