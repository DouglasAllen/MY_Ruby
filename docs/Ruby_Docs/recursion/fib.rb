

def fib(x)
	"""assumes x an int >= 0
	returns Fibonacci of x"""
	#~ while x.class == Integer and x >= 0
		if x == 0 or x == 1
			result = 1
		else
			result =  fib(x-1) + fib(x-2)
		end
	#~ end
	result
end

x = 5
puts "fib(5) = #{fib(x)}"
	  