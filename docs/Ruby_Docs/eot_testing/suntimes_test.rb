require 'equation_of_time'

# Change these for your geo location
@latitude = 41.9474  # + in Northern Hemishere,  - in Southern Hemisphere
@longitude = -88.74467  # + East of zulu time zone, - West of zulu time zone
@zone = -6 # Time offset for zone.

eot = Equation_of_Time.new
eot.jd = Date.today.jd
eot.longitude = @longitude
eot.latitude = @latitude
puts "Sunrise today = #{eot.display_time(eot.sunrise_time + @zone)[0..7]}"
puts "Sunset today = #{eot.display_time(eot.sunset_time + @zone)[0..7]}"