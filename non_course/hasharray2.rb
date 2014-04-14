

a = %w(apple banana apple apple orange banana)
test = Hash.new { |h, key| h[key] = [] }

a.each_with_index do |fruit, i|
  test[fruit] << i
  p test.keys    # debug
  p test.values  # debug
  puts           # debug
end
