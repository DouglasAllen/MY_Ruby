require 'webrick'
include WEBrick
 
# Use user supplied directory or default one
 
root = if ARGV.size != 0
  ARGV[0]
else
  p File.join(Dir::pwd,"htdocs")
end
 
puts "Serving #{ root } directory..."
 
s = HTTPServer.new(
  :Port => 2000,
  :DocumentRoot => root
)
 
trap("INT"){ s.shutdown }
 
s.start 
