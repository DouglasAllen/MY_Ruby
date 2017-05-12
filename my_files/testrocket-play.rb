'\b'
# require 'testrocket'
# require 'profile'

# +-> { 'test'.each_byte }
# +-> { 'test'.each_char }
# +-> { 'test'.each_line }

threes_and_fives = Enumerator.new do |y|
  0.upto(360) do |num|
    y << num if (num % 15).zero?
  end
end

# --> { loop { threes_and_fives.next } }
# --> { loop { puts threes_and_fives.next } }
# threes_and_fives.rewind
# loop { puts threes_and_fives.peek }
# 0.upto(360).each.select { |num| p num if (num % 15).zero? }
# e = Enumerator.new(ObjectSpace, :each_object)
# e = ObjectSpace.each_object(Class)
# e.class
objects = []
# objects << e.select { |obj| obj }
objects.sort!
# objects.each { |o| p o }
p c = ObjectSpace.count_objects
p c.class
p c.fetch(:TOTAL) - c.fetch(:FREE)
count = ObjectSpace.each_object(Object) { |x| x }
puts "Total count: #{count}"

