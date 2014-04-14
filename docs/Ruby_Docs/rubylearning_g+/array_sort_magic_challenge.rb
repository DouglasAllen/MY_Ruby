require 'profile'
# a = [1,4,2,0,8,9]
 a = [1,0,4,0,2,0,8,9]

# insert magic
# => [1, 2, 4, 8, 9, 0]
# array.sort_by {|x| x == 0 ? array.max + 1 : x }
 a.sort.partition{|x| x!=0 }.flatten
 p a
# a.sort! and (a << a.shift while a[0].zero?)
# b = a.slice(0..2).sort
# c = a.slice(4..5)
# d = [ 0 ].reverse
# b + c + d
# b = a.sort
# b.push(b.shift)
# a.sort!
 
# loop and move zeros to end
# while a.first == 0
  #shifting all non-zero elements down by one
  # a.shift
  # put a zero on to the end of array
  # a.push(0)
# end
# def compare(x, y)
# 	if x > y
# 		y.zero? ? -1 : 1
# 	elsif y > x
# 		x.zero? ? 1 : -1
# 	else
# 		0
# 	end
# end
 
# a = [23, 4, 8, 4, 0, 2, 0, 17]
 
# a.sort! { |x, y| compare(x, y) }
 
# 
# a = [1,4,2,0,8,0,0,3,9]
# a.sort!
 
# while a[0] == 0
#   a << a.shift
# end
# a = [1,4,2,0,8,0,0,3,9] 
# b = a.sort
# c = a.grep(0)
# b.delete(0)
# b = b.concat(c)
# a.group_by { |e| e }.map(&:last).sort

# p a
# array = [1,4,2,0,8,0,0,3,9]
# p array
# array = array.group_by { |element| element }.map(&:last).sort
# p array
# array << array.shift
# p array
# array = array.flatten
# p array



