def recursiveMultiply(a, b)
  case
    when b == 0
      return 0
    when b >= 1
       return a + recursiveMultiply(a, b-1)
    when b <= -1
      return -a + recursiveMultiply(a, b+1)
    end
end

puts recursiveMultiply(8, 0)
puts recursiveMultiply(3, 4)
puts recursiveMultiply(-3, 4)
puts recursiveMultiply(-4, 3)
puts recursiveMultiply(-3, -4)