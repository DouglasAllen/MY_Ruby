require 'webrick'

class Simple < WEBrick::HTTPServlet::AbstractServlet
  def do_GET request, response
    status, content_type, body = do_stuff_with request

    response.status = status
    response['Content-Type'] = content_type
    response.body = body
  end

  def do_stuff_with request
    return 200, 'text/plain', 'you got a page'
  end
end

root = File.expand_path '/var/www'
server = WEBrick::HTTPServer.new :Port => 9292, :DocumentRoot => root
server.mount '/simple', Simple
trap 'INT' do server.shutdown end
server.start

=begin

Should see something like this below in console
[2015-08-13 08:23:19] INFO  WEBrick 1.3.1
[2015-08-13 08:23:19] INFO  ruby 2.2.2 (2015-04-13) [i686-linux]
[2015-08-13 08:23:19] INFO  WEBrick::HTTPServer#start: pid=5319 port=9292

and in browser at
http://localhost:9292/simple

you got a page

or perhaps
http://localhost:9292

It works!

This is the default web page for this server.

The web server software is running but no content has been added, yet.

TODO:
* see if we may render some *.erb files later

=end
