def point(x,y,color, size)
 stroke color
 (0..size).each do |i|
  line x,y,x+size,y+i
 end 
end

require 'bigdecimal'
require 'date'

def bd(var)
  BigDecimal(var.to_s)
end

def truncate(x)
  bd(360.0 * ( x / 360.0 - Integer( x / 360.0)))
end
  
def mla(ajd_plus)
  t = bd((ajd_plus - 2451545.0) / 36525.0)
  d = bd(t * 36525.0)
  bd(truncate(280.46061666 + 
         d * 360.98564736629 + 
          t * (t * 0.000387933 - 
              t * (t / 38710000.0))))
end

def gmst(t)
  @year = t.year
  @month = t.month
  @day = t.day      
  @date = Date.parse("#{@year}-#{@month}-#{@day}")
  @ajd = @date.ajd * 1.0
  @hour = t.hour
  @min = t.min
  @sec = t.sec
  @total = @hour / 24.0 + @min / 1440.0 + @sec / 86400.0
  @ajdnow = @ajd + @total  
  ( mla(@ajdnow) / 15.0)#- 88.743 ) / 15.0
end 

def time_now
  t = Time.now.utc  
  @hours = Integer(gmst(t))
  @mins = Integer((gmst(t) - @hours) * 60.0)
  @secs = Integer(((gmst(t) - @hours) - @mins / 60.0) * 3600.0)                     
  Time.utc(@year, @month, @day, @hours, @mins, @secs, t.usec)
end 
  
Shoes.app :height => 760, :width => 1024, :title => "My 24 hour clock" do
  self.fullscreen = true
  background black
  @centery, @centerx = height / 2 - 10, width / 2
  @radius = @centerx / @centery * @centerx + 150
  
  def draw_background
    background black
    # strokewidth 4
    # oval @centerx - @radius, @centery - @radius, @radius, @radius
    
    for i in 0..119    
      stroke green      
      x = (@radius / 2) * Math.sin(i * Math::PI / 12)
      y = (@radius / 2) * Math.cos(i * Math::PI / 12)      
      strokewidth 2
      line(@centerx + x, @centery + y, @centerx + x / 1.3, @centery + y / 1.3)
      
      x_m = (@radius / 2) * Math.sin(i * Math::PI / 30) 
      y_m = (@radius / 2) * Math.cos(i * Math::PI / 30)
      strokewidth 6
      line(@centerx + x_m, @centery + y_m, @centerx + x_m / 1.1, @centery + y_m / 1.1)
    end
  end
  
  draw_background
  
  def clock_hand(time, sw, color=black, unit=30)
    unit == 30 ? radius_local = @radius - 360 : radius_local = @radius - 425
    _x = radius_local * Math.sin( time * Math::PI / unit )
    _y = radius_local * Math.cos( time * Math::PI / unit )
    stroke color
    strokewidth sw
    line(@centerx, @centery, @centerx + _x, @centery - _y)
  end
  
  animate(6) do
    # @time = Time.now.utc
    @time = time_now
    clear do
      draw_background
      stack do
        background black
        # para @time.to_s, :stroke => white
        # para @time.strftime("%A"), :stroke => white
          # span(@time.strftime(" %b %d, %Y "), :stroke => "#ccc"), 
          # strong(@time.strftime("%I:%M"), :stroke => white), 
          # @time.strftime(":%S"), :stroke => white,
            # :margin => 4
      
        clock_hand @time.hour, 8, gold, 12# + (@time.min / 60.0), 8, gold, 0
        clock_hand @time.min, 5, gold# + (@time.sec / 60.0), 5, gold      
        clock_hand @time.sec + (@time.usec * 0.000001), 2, red
      end
    end
  end

end
