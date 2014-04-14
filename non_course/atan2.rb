def rad_to_deg(rad)
  rad * 180 / Math::PI
end

#~ p rad_to_deg Math.atan2(-0.0, -1.0) #=> -3.141592653589793
#~ p rad_to_deg Math.atan2(-1.0, -1.0) #=> -2.356194490192345
#~ p rad_to_deg Math.atan2(-1.0, 0.0)  #=> -1.5707963267948966
#~ p rad_to_deg Math.atan2(-1.0, 1.0)  #=> -0.7853981633974483
#~ p rad_to_deg Math.atan2(-0.0, 1.0)  #=> -0.0
#~ p rad_to_deg Math.atan2(0.0, 1.0)   #=> 0.0
#~ p rad_to_deg Math.atan2(1.0, 1.0)   #=> 0.7853981633974483
#~ p rad_to_deg Math.atan2(1.0, 0.0)   #=> 1.5707963267948966
#~ p rad_to_deg Math.atan2(1.0, -1.0)  #=> 2.356194490192345
#~ p rad_to_deg Math.atan2(0.0, -1.0)  #=> 3.141592653589793

#~ puts

def atn2(y, x)
  if Math::atan(y) == 0 && Math::atan(x) < 0    
    return Math::atan(y/x) - Math::PI
  #~ elsif y == 0 && x > 0
    #~ return y
  #~ elsif y < 0 && x != 0
    #~ return Math::atan(y/x)
  #~ elsif  y < 0 && x == 0
    #~ return Math::PI / -2
  #~ elsif  y < 0 && x > 0
    #~ return y   
  #~ elsif y >=0 && x < 0
    #~ return Math::atan(y/x) + Math::PI 
  #~ elsif  y < 0 && x < 0
    #~ return Math::atan(y/x) - Math::PI
  #~ elsif y > 0 && x == 0
    #~ return Math::PI / 2
  #~ elsif y > 0 && x == 0
    #~ return y
  #~ elsif  y < 0 && x > 0
    #~ return y
  end
end

p atn2(-0.0, -1.0) #  y <= 0 && x < 0
p atn2(-1.0, -1.0) # y < 0 && x < 0
p atn2(-1.0, 0.0)  # y < 0 && x == 0
p atn2(-1.0, 1.0)  # y < 0 && x > 0
p atn2(-0.0, 1.0)  #
p atn2(0.0, 1.0)   #
p atn2(1.0, 1.0)   #
p atn2(1.0, 0.0)   #
p atn2(1.0, -1.0)  #
p atn2(0.0, -1.0)  #
    
