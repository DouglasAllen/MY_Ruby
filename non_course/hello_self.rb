puts "Hello World"

puts "Hello World".class

puts self.class

class Greeting
  def hello(*args)
    "Hello " + args.join(' ')
  end
end
g = Greeting.new
puts g.send(:hello, "gentle", "readers")   #=> "Hello gentle readers"
puts g.class
