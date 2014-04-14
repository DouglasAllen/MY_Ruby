#!/usr/bin/env ruby

require_relative 'spinner2' # Edit this line to try different spinners.

# Our slow recursive Fibonacci function.
def fib(n) (n<=2) ? 1 : (fib(n-2)+fib(n-1)) end

print "Please wait while I calculate a large Fibonacci number."

animation = Spinner.new
result = fib(36)
animation.stop

puts
puts result

#~ require 'io/console'
#~ rows, columns = $stdin.winsize
#~ puts "You screen is #{columns} wide and #{rows} tall"