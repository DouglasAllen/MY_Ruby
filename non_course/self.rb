class Person
  puts self # Person is an instance of Class
  def self.my_class_method
    puts "This is my own class method"
  end
end

puts Person.my_class_method
