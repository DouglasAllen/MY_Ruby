p 5.send :==, 3
p 5.send :===, 5
p 5.send :<=>, 4
p 5.send :<=>, 5
p 5.send :<=>, 6
p 5.send :>, 6
p 5.send :>=, 5
p 5.send :<, 5
p 5.send :<=, 5
p 5.send :zero?
p 5.send :odd?
p 5.send :even?
p 5.send :integer?
p 5.send :eql?, 5
p 5.0.send :real?