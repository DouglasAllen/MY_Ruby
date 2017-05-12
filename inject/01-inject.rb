#!/usr/bin/env ruby

def fact(n)
  (1..n).inject(1) { |a, i| a * i }
end
1.upto(26) { |i| p [i, Math.gamma(i), fact(i - 1)] }

10.times.inject(0) { |t| t + 0.1 }              #=> 0.9999999999999999
10.times.inject(0) { |t| t + Rational('0.1') }  #=> (1/1)



b = proc { |x, y, z, *w| (x || 0) + (y || 0) + (z || 0) + w.inject(0, &:+) }
p b.curry[1][2][3]           #=> 6
p b.curry[1, 2][3, 4]        #=> 10
p b.curry(5)[1][2][3][4][5]  #=> 15
p b.curry(5)[1, 2][3, 4][5]  #=> 15
p b.curry(1)[1]              #=> 1

b = lambda {|x, y, z, *w| (x||0) + (y||0) + (z||0) + w.inject(0, &:+) }
p b.curry[1][2][3]           #=> 6
p b.curry[1, 2][3, 4]        #=> 10
p b.curry(5)[1][2][3][4][5]  #=> 15
p b.curry(5)[1, 2][3, 4][5]  #=> 15
p b.curry(1)[1]                 #=> wrong number of arguments (1 for 3)
