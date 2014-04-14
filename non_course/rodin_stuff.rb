#~ (10..19).each {|i| p 2**i %9}
#~ (0..29).each {|i| puts 9**i % 9}
f = [396, 417, 528, 639, 741, 825]
#~ f.each {|i| puts i%6}
#~ puts 2.0 ** (1/12.0)
#~ puts 528 * 2.0 ** (1/12.0)
include Math
#~ p log2( 528.0 / 440.0)
#~ p 1200 * log2( 528.0 / 440.0)
#~ p 315 / 1200.0
#~ p 528 / 2.0
#~ p 264 / 2 ** (315 / 1200.0)
#~ scale = [130.8, 138.6, 146.8, 155.6, 164.8, 174.6, 185.0, 195.0, 207.7, 220.0, 233.1, 246.9]
#~ new_scale = []
#~ scale.each {|i| new_scale << i * 2 ** (315.641287 / 1200.0)}
#~ p new_scale
#~ new_scale2 = []
#~ new_scale.each {|i| new_scale2 << i * 2 }
#~ p new_scale2
#~ new_scale3 = []
#~ new_scale.each {|i| new_scale3 << i * 4 }
#~ p new_scale3
#~ (0..11).each {puts 528 * 2 ** (1 / 12.0)}

#~ i = 111
#~ while i < 20000
  #~ puts i
  #~ i = i * 2 ** (1 / 12.0)
#~ end
i = 14208
while i > 100
  puts i
  i = i / 2 ** (1 / 12.0)
end
