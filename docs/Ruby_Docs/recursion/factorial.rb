# Program to find the factorial of a number

#  iterative
def factI(n)
    """assumes that n is an int > 0
     returns n!"""
  result = 1
  while n > 1
    result = result * n
    n -= 1
  end
  result
end
 
 n = 3
 puts "Iterative factorial factI(#{n}) = #{factI(n)}"
 
 # recusive
def factR(n)
  """assumes that n is an int > 0
    returns n!"""
  if n == 1
    return n
  end
    n*factR(n-1)
end

n = 3
puts "Recursive factorial factR(#{n}) = #{factR(n)}"