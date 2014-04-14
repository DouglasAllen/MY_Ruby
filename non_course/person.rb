require 'date'

class Person
  puts self #Person as an instance of Class

  def self.my_class_method
    puts "This is my own class method"
  end

  def initialize(name, dob)
    @name = name
    @dob  = Date.parse(dob)
  end

  def age
    # ...
  end

  def marry(someone)
    # ...
  end

  def my_class_method
    puts "This is my own class method"
  end
end

fred = Person.new("Fred", "1967-12-25")
p fred
#puts fred.inspect
#puts fred
Person.my_class_method
fred.my_class_method