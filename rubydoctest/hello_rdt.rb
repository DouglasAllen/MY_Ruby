
=begin # This is the beginning of a comment block
doctest: hello will return "Hello World!"
>> hello 
=> "Hello World!"
doctest: hello "reader" returns "Hello reader!"
>> hello "student"
=> "Hello student!"
=end

def hello name='World'
	"Hello #{name}!"
end