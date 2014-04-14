p 5.send :~  # One’s complement: returns a number where each bit is flipped
p -256.send :~
p 5.send :&, 5 # Bitwise AND
p 5.send :|, 0 # Bitwise OR
p 5.send :^, 2 # Bitwise EXCLUSIVE OR
p 5.send :[], 2 # Bit Reference—Returns the nth bit in the binary representation of fix
p 5.send :[], 1
p 5.send :[], 0
p 5.send :<<, 1 # Bit Shifts fix left count positions (right if count is negative). 
p 5.send :<<, -1
p 5.send :>>, 1
p 5.send :>>, -1