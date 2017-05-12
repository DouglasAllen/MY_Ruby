#!/home3/dcarrera/bin/ruby

# Get the values from the user.
puts "Enter a maximum value: "
maximum = gets.chomp.to_f  # Use String#to_f

# Computer the highest power of 2
count  = 0
number = 1
while number < maximum
    count  += 1
    number *= 2
end

#
# Output:
#

puts " " # Put a space for separation.
puts " " + count.to_s  # The exponent.

#      how many digits 'count' has.
#                   |
#     make string   |
#             |     |
#             V     V
#     count.to_s.length
#
#  After '2' we type as many spaces as there are digits
#  in 'count'.  This gives us a nice formatting.
#
#    " " * count.to_s.length

puts "2" + " " * count.to_s.length + \
     " = " + number.to_s
puts "is the highest "  +            \
     "power of 2 less than " + maximum.to_s
