module HelloWorld
  def show
    puts "Hello World!"
  end
end
 
puts "#{HelloWorld} is a module class."
 
puts "See? #{HelloWorld.class}"
 
puts "#{HelloWorld}'s first ancestor shows an array with #{HelloWorld.ancestors()}."
 
puts "Does #{HelloWorld} module include any other modules? #{HelloWorld.included_modules()}"
 
puts "This is how we may see the module's name HelloWorld.name() = #{HelloWorld.name()}"
 
puts "Is #{HelloWorld} module a singleton class? #{HelloWorld.singleton_class?()}"
 
# hello_world.rb:20:in `<main>': undefined method `show' for HelloWorld:Module (NoMethodError)
# p HelloWorld.show
 
puts "Are there any instance methods in #{HelloWorld} module? #{ HelloWorld.methods(false)}"
 
# Include HelloWorld module in a class
class Greeting
  include HelloWorld
  def hello
    puts show
  end
end
 
grtg = Greeting.new
grtg.hello
 
# Trying to inherit from HelloWorld module is an error.
# hello_world.rb:34:in `<main>': superclass must be a Class (Module given) (TypeError)
#class Greeting2 < HelloWorld
#  def hello
#   puts show
#  end
#end
 
#grtg2 = Greeting2.new
#grtg2.hello 
