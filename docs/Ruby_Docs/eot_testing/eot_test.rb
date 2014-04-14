require 'equation_of_time'

# Constants
p Equation_of_Time::DAY_HOURS     #>= 24.0
p Equation_of_Time::DAY_MINUTES  #>= 1440.0
p Equation_of_Time::DAY_SECONDS #>= 86400.0
p Equation_of_Time::DAY_USECS     #>= 86400000000.0
p Equation_of_Time::J2000             #>= 2451545.0
# Math include
p Equation_of_Time::PI
# Class instance 
eot = Equation_of_Time.new
p eot

puts eot.date.class
puts eot.jd.class
puts eot.ajd.class
puts eot.latitude.class
puts eot.longitude.class

eot.date= Date.today
eot.jd= eot.date.jd
puts eot.jd
eot.ajd= eot.date.ajd
puts eot.ajd
puts eot.ajd_time
