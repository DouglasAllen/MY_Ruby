#!/usr/bin/env ruby

# Sum some numbers
(5..10).reduce(:+) #=> 45
[1, 2, 3, 4].inject(:+) #=> 10

# Same using a block and inject
[4, 2, 1, 3].inject(0) { |acc, elem| acc + elem } # => 10

[1, 2, 3, 4].inject { |acc, elem| acc + elem } # => 10
(0..4).inject { |acc, elem| acc + elem }

(5..10).inject { |acc, elem| acc + elem } #=> 45

[1, 2, 3, 4].inject(5) { |acc, elem| acc + elem } # => 15

result = 0 # initialize result
[1, 2, 3, 4].map { |element| result += element }
# result => 10
p result

# Multiply some numbers
(5..10).reduce(1, :*) #=> 151200

# Same using a block
(5..10).inject(1) { |acc, elem| acc * elem } #=> 151200

# find the longest word
longest = %w(cat sheep bear).inject do |memo, word|
  memo.length > word.length ? memo : word
end

puts longest

[1, 'a', Object.new, :hi].inject({}) do |hash, item|
         # hash[item.to_s] = item
end

hash =
  [[:first_name, 'Shane'],
   [:last_name, 'Harvie']].each_with_object({}) do |element, result|
    result[element.first] = element.last
  end

puts hash

def my_function(r, e)
  r + e
end

a = [1, 2, 3, 4]
result = 0

a.each do |value|
  result = my_function(result, value)
end

def incomplete_inject(enumerable, result)
  enumerable.each do |item|
    result = yield(result, item)
  end
  result
end

p incomplete_inject([1, 2, 3, 4], 0) { |sum, item| sum + item } # => 10

p [1, 2, 3, 4].inject(0) { |acc, elem| acc + elem }
p [2, 3, 4].inject(0 + 1) { |acc, elem| acc + elem }
p [3, 4].inject((0 + 1) + 2) { |acc, elem| acc + elem }
p [4].inject(((0 + 1) + 2) + 3) { |acc, elem| acc + elem }
p [].inject((((0 + 1) + 2) + 3) + 4) { |acc, elem| acc + elem }
p (((0 + 1) + 2) + 3) + 4



hash1 = Hash[*[[:first_name, 'Shane'], [:last_name, 'Harvie']].flatten]

hash2 = Hash[*[[first_name: 'Shane'], [last_name: 'Harvie']].flatten]

hash3 = { first_name: 'Shane', last_name: 'Harvie' }

puts hash1, hash2, hash3


[1, 2, 3, 4, 5, 6].select(&:even?).collect(&:to_s)

result = [1, 2, 3, 4, 5, 6].inject([]) do |acc, elem|
  elem.even? ? acc << elem.to_s : acc
end
puts result

Test_First_Result = Struct.new(:status, :message)
results = [
  Test_First_Result.new(:failed, '1 expected but was 2'),
  Test_First_Result.new(:sucess),
  Test_First_Result.new(:failed, '10 expected but was 20')
]

messages = results.select { |test_result|
test_result.status == :failed }.collect(&:message)
puts messages # => ["1 expected but was 2", "10 expected but was 20"]

Test_Result = Struct.new(:status, :message)
results = [
  Test_Result.new(:failed, '1 expected but was 2'),
  Test_Result.new(:sucess),
  Test_Result.new(:failed, '10 expected but was 20')
]

messages = results.each_with_object([]) do |test_result, messages|
  messages << test_result.message if test_result.status == :failed
  messages
end
puts messages # => ["1 expected but was 2", "10 expected but was 20"]

TestResult = Struct.new(:status, :message)
results = [
  TestResult.new(:failed, '1 expected but was 2'),
  TestResult.new(:sucess),
  TestResult.new(:failed, '10 expected but was 20')
]

grouped_results = results.each_with_object({}) do |test_result, grouped|
  grouped[test_result.status] = [] if grouped[test_result.status].nil?
  grouped[test_result.status] << test_result
  grouped
end

puts grouped_results
# >> {:failed => [
# >>    #<struct TestResult status=:failed, message="1 expected but was 2">,
# >>    #<struct TestResult status=:failed, message="10 expected but was 20">],
# >>  :sucess => [ #<struct TestResult status=:sucess, message=nil> ]
# >> }

#
class Recorder
  instance_methods.each do |meth|
    undef_method meth unless meth =~ /^(__|inspect|to_str)/
  end

  def method_missing(sym, *args)
    messages << [sym, args]
    self
  end

  def messages
    @messages ||= []
  end
end
#
class Recorder
  def play_for(obj)
    messages.inject(obj) do |result, message|
      result.send message.first, *message.last
    end
  end
end

recorder = Recorder.new
recorder.methods.sort
recorder.play_for(String)

# >> ["<", "<=", "<=>", "==", "===", "=~", ">", ">=", "__id__", ...]
