# Experimenting with metaprogramming inspired from 
# http://rubymonk.com/learning/books/2-metaprogramming-ruby/chapters/32-introduction-to-metaprogramming/lessons/75-being-meta

require 'yaml'
 
my_eval_array = %q{
def hello;'Hello from inside the first element';end
puts hello
def look;'Behold the power of double quotes.';end
puts look}
 
test_string = my_eval_array.to_yaml
 
filename = 'eval_test.txt'
 
File.open filename, 'w' do |f|
  f.write test_string
end
 
puts test_string
 
filename = 'eval_test.txt'
 
read_string = File.read filename
 
read_array = YAML::load read_string
 
eval(read_array.to_s)

