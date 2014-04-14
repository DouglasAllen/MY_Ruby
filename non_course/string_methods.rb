#l2e1.rb
#my_string = 'Hello Ruby World'
 
#  String gets called before method of same name.
def my_string  
  'Hello World'
end
 
puts my_string
 
#Change the order of string and method of same name.
my_string = 'Hello Ruby World'
 
puts my_string #Try again
 
# method name is different from string and looks more like a method with no parameters.
def my_string()
'Hello World'
end
 
puts my_string()
 
# Try to name a string with parameters.
my_string() = 'Hello World of Ruby!'
 
puts my_string()
