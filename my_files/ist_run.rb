

#
class Options < Hash
  attr_writer :options
end
status = 200
header = { 'Content-Type' => 'text/html' }
body   = ['hello world!']
response = [status,
            header,
            body]
app = ->(e) { response }
options = Options.new
options.store(:app, app)
options.store(:server, 'webrick')
options.store(:Port, 3000)
options.store(:Host, '0.0.0.0')
# p options
# p options.instance_variables

# Rack::Server.start(options hash of variables)
require 'rack'

Rack::Server.start options

# my runner for first code list without rewritting the config.ru and to
# play with options hash as well.
# see : https://www.youtube.com/watch?v=evDJMLb1d28
