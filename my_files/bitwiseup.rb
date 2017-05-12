
# original modified to simplicity
def res(n)
  ~ (~ 1 << n)
end

p res 5

# new procedures
def bits_shift_left(o, n, x = 0)
  o = o.<< n
  x += 1
  while o < 2**8189
    puts
    p o
    bits_shift_left(o, n, x)
  end
end

# bits_shift_left(1, 1)

def bitwise_shift_left(o, n)
  o << n
end


def bitwise_complement_bits(args)
  ~ args
end

a = bitwise_complement_bits(1)
b = bitwise_shift_left(a, 5)
p bitwise_complement_bits(b)

p self
def test=(n)
  @test = n
end

self.test = 5
p @test




