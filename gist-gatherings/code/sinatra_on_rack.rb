require 'sinatra'

configure do
  Sinatra::Application.reset!
  use Rack::Reloader
end

before do
  content_type :txt
end

get '/' do
  "is this a get request?" + request.get?.inspect + "\n"
end

get '/new' do
  request = Rack::Request.new(env)
  request.env.inspect
end

get '/env' do
  request.env.map { |e| e.to_s + "\n" }
end

=begin
This application will iterate over all the values in the @env variable and display them as
output.

 curl http://localhost:4567/env

["SERVER_SOFTWARE", "thin 1.6.3 codename Protein Powder"]
["SERVER_NAME", "localhost"]
["rack.input", #<StringIO:0xb970e464>]
["rack.version", [1, 0]]
["rack.errors", #<IO:<STDERR>>]
["rack.multithread", true]
["rack.multiprocess", false]
["rack.run_once", false]
["REQUEST_METHOD", "GET"]
["REQUEST_PATH", "/env"]
["PATH_INFO", "/env"]
["REQUEST_URI", "/env"]
["HTTP_VERSION", "HTTP/1.1"]
["HTTP_USER_AGENT", "curl/7.26.0"]
["HTTP_HOST", "localhost:4567"]
["HTTP_ACCEPT", "*/*"]
["GATEWAY_INTERFACE", "CGI/1.2"]
["SERVER_PORT", "4567"]
["QUERY_STRING", ""]
["SERVER_PROTOCOL", "HTTP/1.1"]
["rack.url_scheme", "http"]
["SCRIPT_NAME", ""]
["REMOTE_ADDR", "127.0.0.1"]
["async.callback", #<Method: Thin::Connection#post_process>]
["async.close", #<EventMachine::DefaultDeferrable:0xb970df00>]
["sinatra.commonlogger", true]
["rack.logger", #<Logger:0xb970de88 @progname=nil, @level=1, @default_formatter=#<Logger::Formatter:0xb970de74 @datetime_format=nil>, @formatter=nil, @logdev=#<Logger::LogDevice:0xb970de24 @shift_size=nil, @shift_age=nil, @filename=nil, @dev=#<IO:<STDERR>>, @mutex=#<Logger::LogDevice::LogDeviceMutex:0xb970ddd4 @mon_owner=nil, @mon_count=0, @mon_mutex=#<Mutex:0xb970dd84>>>>]
["rack.request.query_string", ""]
["rack.request.query_hash", {}]
["sinatra.route", "GET /env"]

=end
