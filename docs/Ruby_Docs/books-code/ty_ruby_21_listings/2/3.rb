#!/usr/bin/env ruby
joe = Object.new
frank = Object.new
def frank.weather
  return "It's a fine day."
end
def joe.ask_brother(b)
  return b.weather
end
puts "Frank says: #{frank.weather}"
puts "Joe says: #{joe.ask_brother(frank)}"
