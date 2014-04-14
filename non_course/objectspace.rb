
ObjectSpace.each_object(Numeric) {|x| p x }

puts

ObjectSpace.each_object(Numeric) do |x|
  p x
end
