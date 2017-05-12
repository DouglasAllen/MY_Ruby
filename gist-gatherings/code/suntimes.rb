# The following gem is not in rubygems.org yet. Please use the gem on github. Thanks!
require 'eot'

# Change these for your geo location
@latitude = 41.9474 # + in Northern Hemishere, - in Southern Hemisphere
@longitude = -88.74467 # + East of zulu time zone, - West of zulu time zone
@zone = -5 # Time offset for zone.

# You need to be sure the date is in UTC
@date = Date.parse("#{Time.now.utc.year}-#{Time.now.utc.month}-#{Time.now.utc.day}")
eot = Eot.new
#eot.date = @date
#~ eot.jd= @date.jd

eot.longitude= @longitude
eot.latitude= @latitude
eot.jd = @date.jd

# get the times for a few more days.
for i in 0..50
  eot.date = (@date + i).to_s
  jd = eot.jd + i
  puts "Sunrise #{eot.sunrise_dt}"
  puts "Sunrise #{eot.sunrise_dt.to_time.utc}"
  puts "Sunset #{eot.sunset_dt}"
  # reset the date after this else it increments twice if sunset time is over 24.
  eot.date = (@date + i).to_s
  puts "Sunset #{eot.sunset_dt.to_time.utc}"
end 
