#!/usr/bin/env ruby

def foo
  4.0 / baz(5)
end

def baz(n)
  sum = 0
  n.times do |i|
    sum += quux(i)
    puts "#{i}, #{quux(i)}, #{sum}"
  end
  puts "#{n}, #{sum}, #{n + sum}"
  n + sum
end

def quux(v)
  9 / (5 - v)
end

puts foo
# puts 4 / 24.0
