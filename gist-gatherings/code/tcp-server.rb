require 'socket'

server = TCPServer.new('localhost', 2345)

while (session = server.accept)
  puts "Request: #{session.gets}"
  session.print "HTTP/1.1 200/OK\r\n" +
                "Content-type: text/html\r\n" +
                "\r\n"
  session.print "<html><body>" +
                "<h1>#{Time.now}</h1>" +
                "</body></html>" +
                "\r\n"
  session.close
end