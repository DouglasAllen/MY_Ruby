# http://rackapp.herokuapp.com/hello

# getjd.rb
 
require 'date'
 
d = Date.today
t = Time.now.utc
dutc = "#{t.year}-#{t.month}-#{t.day}"
jdtime = t.hour / 24.0 + t.min / 1440.0 + t.sec / 86400.0
puts t
puts "#{d} = Your computer's date "
puts "#{dutc} = The UTC Date"
puts Date.parse(dutc).ajd
puts Date.parse(dutc).ajd * 1.0
puts Date.parse(dutc).jd
puts jdtime
puts Date.parse(dutc).ajd * 1.0 + jdtime 
