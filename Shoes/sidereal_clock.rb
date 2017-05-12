
# Shoes Clock by Thomas Bell
# posted to the Shoes mailing list on 04 Dec 2007

require 'bigdecimal'
require 'date'
require 'green_shoes'
#
Shoes.app height: 260, width: 250 do
  @radius = 90
  @centerx = 126
  @centery = 140
  animate(1) do
    @timenow = Time.now.utc
    @year = @timenow.year
    @month = @timenow.month
    @day = @timenow.day
    @date = Date.parse("#{@year}-#{@month}-#{@day}")
    @ajd = @date.ajd * 1.0
    @hour = @timenow.hour
    @min = @timenow.min
    @sec = @timenow.sec
    @total = @hour / 24.0 + @min / 1440.0 + @sec / 86_400.0
    @ajdnow = @ajd + @total
    @sidereal_time = sidereal_time(@ajdnow)
    @hours = Integer(@sidereal_time)
    @mins = Integer((@sidereal_time - @hours) * 60.0)
    @secs = Integer(((@sidereal_time - @hours) - @mins / 60.0) * 3600.0)
    @time = Time.utc(@year, @month, @day, @hours, @mins, @secs)
    clear do
      background black
      # draw_background
      stack do
        # background black
        para strong('GMST   ', @time.strftime('%H:%M:%S')), stroke: white
        para strong('LMST   ', @time.strftime('%H:%M:%S')), stroke: white
      end
      # clock_hand @time.sec + (@time.usec * 0.000001), 2, 30, red
      # clock_hand @time.min + (@time.sec / 60.0), 5
      # clock_hand @time.hour + (@time.min / 60.0), 8, 6
    end
  end

  # def draw_background
  # background rgb(230, 240, 200)
  # fill white
  # stroke black
  # strokewidth 4
  # oval @centerx - 102, @centery - 102, 204, 204
  # fill black
  # nostroke
  # oval @centerx - 5, @centery - 5, 10, 10
  # stroke black
  # strokewidth 1
  # line(@centerx, @centery - 102, @centerx, @centery - 95)
  # line(@centerx - 102, @centery, @centerx - 95, @centery)
  # line(@centerx + 95, @centery, @centerx + 102, @centery)
  # line(@centerx, @centery + 95, @centerx, @centery + 102)
  # end

  def clock_hand(time, sw, unit = 30, color = black)
    radius_local = unit == 30 ? @radius : @radius - 15
    _x = radius_local * Math.sin(time * Math::PI / unit)
    _y = radius_local * Math.cos(time * Math::PI / unit)
    stroke color
    strokewidth sw
    line(@centerx, @centery, @centerx + _x, @centery - _y)
  end

  def time_now
    t = Time.now.utc
    bd(t.hour / 24.0) + bd(t.min / 1440.0) + bd(t.sec / 86_400.0)
  end

  def bd(var)
    BigDecimal(var.to_s)
  end

  def truncate(x)
    bd(360.0 * (x / 360.0 - Integer(x / 360.0)))
  end

  def mst(d, t)
    280.46061666 +
      360.98564736629 * d +
      t * (t * 0.000387933 -
      t * (t / 38_710_000.0))
  end

  def sidereal_time(time)
    t = bd((time - 2_451_545.0) / 36_525.0)
    d = bd(t * 36_525.0)
    s_time.call(time)
    bd(truncate(mst(d, t))) / 15.0
  end
end

s_time = Proc.new {|time| 
  t = bd((time - 2_451_545.0) / 36_525.0)
    d = bd(t * 36_525.0)}
