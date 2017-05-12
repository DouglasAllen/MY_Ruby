def greeter name
  return "Hey " + name
end

greeter "Bill"

def by_three? number
  number % 3 == 0 ? true : false
end

puts by_three? 27
puts by_three? 28