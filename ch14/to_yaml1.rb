# The Book of Ruby - http://www.sapphiresteel.com

require 'yaml'

#~ puts( "hello world".to_yaml )
puts "hello world".to_yaml
puts
#~ puts( 123.to_yaml )
puts 123.to_yaml
puts
#~ puts( ["a1", "a2" ].to_yaml )
puts ["a1", "a2" ].to_yaml
puts
puts( {:h1 => 1, :h2 => 2}.to_yaml )
#~ puts {:h1 => 1, :h2 => 2}.to_yaml  # syntax error, unexpected tASSOC, expecting '}'