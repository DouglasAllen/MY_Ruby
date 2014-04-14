# http://ruby.about.com/od/variables/a/Class-Variables.htm
class TestClass
  puts "Inside of TestClass"
    
  def self.say_hello
    puts "Hello from class method"
  end 
end 
  
TestClass.say_hello

class Motorcycle
  @@wheels = 2
    
  def self.wheels
    @@wheels
  end 
end 
  
class MotorcycleWithSidecar < Motorcycle
  @@wheels = 4

  # Only MotorcycleWithSidecar can access @@test
  @@test = 10
end
    
class A
  @@test = 1
  def self.test; @@test; end
end

class B < A
end

class C < B
  @@test = 2
end

puts A.test
puts Motorcycle.wheels

module GetInstance
  def get_instance
    if instance == nil
      instance = new
    else
      instance
    end
  end
end

class Shape
  @instance = nil

  class << self
    attr_accessor :instance
  end

  extend GetInstance
end

class Square
  @instance = nil

  class << self
    attr_accessor :instance
  end

  extend GetInstance
end

shape = Shape.get_instance
square = Square.get_instance

puts shape.inspect
puts square.inspect