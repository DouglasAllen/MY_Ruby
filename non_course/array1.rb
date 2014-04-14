
# p021rangesex.rb
s = 'key=value'
i = s.index('=')
s1 = s[0...i]
s2 = s[i+1,s.length]
puts s1, s2
