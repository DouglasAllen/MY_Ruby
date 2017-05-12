puts 212 ^ 17
puts 212.send :^, 12
puts 212 ** 17
puts 212 ** 17.0
n = 212 ** 17
puts n ** (1/17)
puts n ** (1.0/17)
n = 212 ** 17.0
puts n ** (1.0/17)

require 'bigdecimal'

def bd var = 0
    BigDecimal(var.to_s) * 1.0
end

puts  bd  n ** (1.0/17)
puts  (bd  n ** (1.0/17)).round