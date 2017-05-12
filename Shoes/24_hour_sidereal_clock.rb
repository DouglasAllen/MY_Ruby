#
# Shoes Clock by Thomas Bell
# posted to the Shoes mailing list on 04 Dec 2007
#
require 'bigdecimal'
require 'date'
require 'green_shoes'
#
Shoes.app height: 600, width: 800, title: '        Greenwich Mean Sidereal Time' do
  @centerx = width / 2
  @centery = height / 2
  @radius = @centerx / @centery * @centerx

  animate(8) do
    @timenow = Time.now.utc
    @year = @timenow.year
    @month = @timenow.month
    @day = @timenow.day
    @date = Date.parse("#{@year}-#{@month}-#{@day}")
    @ajd = @date.ajd * 1.0
    # ~ @hour = @timenow.hour
    # ~ @min = @timenow.min
    # ~ @sec = @timenow.sec
    # ~ @total = @hour / 24.0 + @min / 1440.0 + @sec / 86400.0
    @ajdnow = @ajd + time_now(@timenow)
    @sidereal_time = sidereal_time(@ajdnow)
    @hours = Integer(@sidereal_time)
    @mins = Integer((@sidereal_time - @hours) * 60.0)
    @secs = Integer(((@sidereal_time - @hours) - @mins / 60.0) * 3600.0)
    @time = Time.utc(@year, @month, @day, @hours, @mins, @secs)
    clear do
      draw_background
      stack do
        background black
        clock_hands
        para strong(@time.strftime('%H:%M:%S'), stroke: white)
      end
    end
  end

  def draw_background
    background black

    fill black
    stroke black
    strokewidth 4
    oval @centerx - @radius / 2, @centery - @radius / 2, @radius, @radius

    (0..119).each do |i|

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

  def clock_hands
    #    clock_hand @time.sec + (@time.usec * 0.000001),2,30,red
    clock_hand @time.sec, 2, 30, red
    clock_hand @time.min + (@time.sec / 60.0), 5, 30, green
    clock_hand @time.hour + (@time.min / 60.0), 8, 12, green
 end

  def clock_hand(time, sw, unit = 30, color = black)
    radius_local = unit == 30 ? @radius / 2 - 8 : @radius / 2 - 55
    _x = radius_local * Math.sin(time * Math::PI / unit)
    _y = radius_local * Math.cos(time * Math::PI / unit)
    stroke color
    strokewidth sw
    line(@centerx, @centery, @centerx + _x, @centery - _y)
  end

  def time_now(t)
    # t = Time.now.utc
    bd(t.hour / 24.0) + bd(t.min / 1440.0) + bd(t.sec / 86_400.0)
  end

  def bd(var)
    BigDecimal(var.to_s)
  end

  def truncate(x)
    bd(360.0 * (x / 360.0 - Integer(x / 360.0)))
  end

  def sidereal_time(time)
    t = bd((time - 2_451_545.0) / 36_525.0)
    d = bd(t * 36_525.0)
    bd(truncate(280.46061666 +
         d * 360.98564736629 +
        t * (t * 0.000387933 -
         t * (t / 38_710_000.0)))) / 15.0
  end
end
