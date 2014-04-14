a = %w(apple banana apple apple orange)
a.inject(Hash.new(0)) do |h, fruit|
  p [h, fruit, h[fruit]]  # debug
  h[fruit] += 1
  p h                     # debug
  puts                    # debug
  h
end