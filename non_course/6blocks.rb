# The Book of Ruby - http://www.sapphiresteel.com

a = "hello world"

def myblock_function
	yield 
end

#a = "hello world"

puts( a )

myblock_function{ |a| puts( a ) }

# so what is a now...?
puts( a )

