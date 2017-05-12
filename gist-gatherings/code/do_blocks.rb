# http://phrogz.net/ProgrammingRuby/language.html#blocksclosuresandprocobjects

# http://stackoverflow.com/questions/420147/ruby-block-and-unparenthesized-arguments

require 'pp'
x = 1..3
pp x.map do |i| {:value => i, :double => (i*2)} end
pp x.map { |i| {:value => i, :double => (i*2)} }

pp(x.map do |i| {:value => i, :double => (i*2)} end)
pp(x.map { |i| {:value => i, :double => (i*2)} })

# http://stackoverflow.com/questions/533008/what-is-the-difference-or-value-of-these-block-coding-styles-in-ruby

cmds.each do |cmd|
end

cmds.each { |cmd| }
   
cmds = [ "create", "update", "list", "help" ]

# Block style one
#
cmds.each do |cmd|
  puts "loop1, cmd: #{cmd}"
end

# Block style two
#
cmds.each { |cmd|
  puts "loop2, cmd: #{cmd}"
}

def foo
  yield
end

puts foo { "hello" }

# LocalJumpError: no block given (yield) in 'foo'
# puts foo do
#   "hello"
# end

cmds.each do |cmd| cmd.upcase! end.sort

cmds.each { |cmd| cmd.upcase! }.sort

# https://pragprog.com/book/ruby/programming-ruby

# http://stackoverflow.com/questions/3680097/ruby-multiline-block-without-do-end

3.upto(9) {
  print "Hello"
  puts " World"
}

3.upto(9) do |n|
  print "Hello "
  puts n
end

3.upto 9 do 
  puts "Hi" 
end

3.upto (9) {puts "Hi"}

[3,1,2].sort{|x,y| y<=>x}.map{|x| x+1}

def foo arg
  if block_given?
    puts "Block given to foo"
    yield arg
  else
    puts "No block given to foo"
    arg
  end
end


def bar
  if block_given?
    puts "Block given to bar"
    yield "Yielded from bar"
  else
    puts "No block given to bar"
  end
  "Returned from bar"
end

foo bar { |arg| puts arg }

foo bar do |arg| puts arg end

[1,2,3].map do |x| x+1 end.each do |x| puts x end

# http://stackoverflow.com/questions/6179442/block-definition-difference-between-braces-and-do-end

print ((1..10).collect do |x| x**2 end)

print ((1..10).collect { |x| x**2 })

puts (1..10).map { |i| i*2 }

puts (1..10).map do |i| i*2 end

# http://stackoverflow.com/questions/6718340/code-block-passed-to-each-works-with-brackets-but-not-with-do-end-ruby

# http://stackoverflow.com/questions/6854283/ruby-block-syntax-error

[1, 2, 3].inject(0) { |x, y| x + y }

# https://github.com/carrierwaveuploader/carrierwave

# http://stackoverflow.com/questions/2122380/using-do-block-vs-brackets?lq=1

my_array = [:uno, :dos, :tres]
my_array.each { |item| 
  puts item
}

my_array = [:uno, :dos, :tres]
my_array.each do |item| 
  puts item
end

my_array.each { |item| puts item }

def method1(var)
  puts "inside method1"
  puts "method1 arg = #{var}"
  if block_given?
    puts "Block passed to method1"
    yield "method1 block is running"
  else
    puts "No block passed to method1"
  end
end

def method2
  puts"inside method2"
  if block_given?
    puts "Block passed to method2"
    return yield("method2 block is running")
  else
    puts "no block passed to method2"
    return "method2 returned without block"
  end
end

#### test ####

method1 method2 do 
    |x| puts x
end

method1 method2{ 
    |x| puts x
}
  
1.upto(10) do |x|
  add_some_num = x + rand(10)
  puts '*' * add_some_num
end

