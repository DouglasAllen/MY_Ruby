def point(x,y,color, bg_color)
 stroke color
 line x,y,x,y+1
 line x+1,y,x+1,y+1
 line x,y+1,x,y+2
 line x+1,y+1,x+1,y+2
 # stroke bg_color
 # line x,y+1,x+1,y+1
end

# Shoes.app  :height => 760, :width => 1024, :title => "     Roseland Revisited" do
 @centerx, @centery = 1024 / 2, 760 / 2
 @radius = @centerx / @centery * @centerx
 a = 1024 / 760
 g = 665
 # background white
  (0..6.29).step(0.000175) do |i|
    r = @radius * Math.sin(g * i)
    x = (r * Math.cos(i)) + @centerx
    y = (r * Math.sin(i)) * a + @centery
    # point x.to_i, y.to_i, r.to_i.abs
    r > 256 ? c = (r.to_i.abs + 1) : c = 256
    c = c * 1024
    p "#0" + c.to_s(16)
  end
 
# end