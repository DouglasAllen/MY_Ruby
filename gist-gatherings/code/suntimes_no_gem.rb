=begin
Output from
ruby rise_set.rb
The current time UTC = 2013-07-11 06:23:54 UTC
Current Julian Cycle = 4940.0
Julian Mean Solar transit = 2456485.0
Approximate Julian EOT = 0.003681045275634499
Julian True Solar transit = 2456485.0036810455
Julian Sunrise 2456484.75153598
Julian Sunset 2456485.255826111
Local Mean Noon 2013-07-11 12:00:00 -0500
Local Noon 2013-07-11 12:05:18 -0500
Local Sunrise 2013-07-11 06:02:12 -0500
Local Sunset 2013-07-11 18:08:23 -0500
Usage
Set your time zone offset at the line tz =....
Mine is -5 hours use 5.5 if you're on a half hour offset.
The latitude and longitude arguments are my coordinates.
Yours are most likely different.
If you are west of Greenwich meridian then use longitude negative.
If you are south of the equator then use latitude negative.
=end
# program begins
$tz = 0
$longitude = 0.0
$latitude = 0.0
 
def local_angle
$longitude / 360.0
end
 
time = Time.now.utc
$year = Time.now.year
$month = Time.now.month
$day = Time.now.day
$radians_multiplier = Math::PI / 180.0
$degrees_multiplier = 180.0 / Math::PI
require 'date'
def jpd_date
Date.new($year, $month, $day).jd
end
# Calculate current Julian Period Cycle
$jpd_2000 = 2451545.0
# http://maia.usno.navy.mil/ser7/deltat.data
jps_delta_time = 67.0258 / 86400.0
$ca = 0.00014 #jps_delta_time or 0.0009 adds too much time
 
def jpd_cycle
jpd_date - $jpd_2000
end
 
# Mean Solar Transit for your Local Hour Angle
def jpd_noon
$jpd_2000 + jpd_cycle - local_angle
end
 
# Solar Mean Anomaly
 
def mean_anomaly
(357.5291 + 0.98560028 * (jpd_noon - $jpd_2000)) % 360
end
 
include Math
# Equation of Center
def equation_of_center
1.9148 * sin(mean_anomaly * $radians_multiplier) +
0.0200 * sin(2.0 * mean_anomaly * $radians_multiplier) +
0.0003 * sin(3.0 * mean_anomaly * $radians_multiplier)
end
 
#............. lambda_periapsis..............
# An approximation of angle when earth is closest to sun in a new year.(about the
# 2nd or 3rd day) There are ways to avoid using it but since wikipedia does I will
# my calculations for @2012 see astro_dog/lib/ptime.rb
#............................................
 
$lambda_periapsis = 180.0 + 102.9372
 
def ecliptic_longitude
(mean_anomaly + equation_of_center + $lambda_periapsis) % 360
end
 
def j_eot
0.0053 * sin(mean_anomaly * $radians_multiplier) -
0.0069 * sin( 2.0 * ecliptic_longitude * $radians_multiplier)
end
 
def j_transit
jpd_noon + j_eot
end
 
def sine_declination
sin(ecliptic_longitude * $radians_multiplier) *
sin(23.436 * $radians_multiplier)
end
 
def declination
asin(sine_declination) * $degrees_multiplier
end
 
# Horizon Angle
# Horizon Angle is the angle between Sunrise to Transit or Transit to Sunset.
 
def cosine_omega
(sin(-0.8333 * $radians_multiplier) /
cos($latitude * $radians_multiplier) *
cos(declination * $radians_multiplier)) -
(sin($latitude * $radians_multiplier) *
sin(declination * $radians_multiplier) /
cos($latitude * $radians_multiplier) *
cos(declination * $radians_multiplier))
end
def hour_angle
acos(cosine_omega) * $degrees_multiplier
end
 
def j_set
j_transit + hour_angle / 360.0
end
def j_rise
j_transit - hour_angle / 360.0
end
 
def julian_period_day_fraction_to_time(jpd_time)
jpd_fraction = jpd_time -0.5 - Integer(jpd_time - 0.5)
fraction = (jpd_fraction * 100000000.0).round / 100000000.0
hours = Integer(fraction * 24.0)
minutes = Integer((fraction - hours / 24.0) * 1440.0)
seconds = Integer((fraction - hours / 24.0 - minutes / 1440.0) * 86400.0)
Time.new($year, $month, $day, hours, minutes, seconds) + $tz * 3600
end
# Output results ^D if in irb
text = <<HEREDOC
The current time UTC = #{time}
Current Julian Cycle = #{jpd_cycle}
Julian Mean Solar transit = #{jpd_noon}
Approximate Julian EOT = #{j_eot}
Julian True Solar transit = #{j_transit}
Julian Sunrise #{j_rise}
Julian Sunset #{j_set}
Local Mean Noon #{julian_period_day_fraction_to_time(jpd_noon)}
Local Noon #{julian_period_day_fraction_to_time(j_transit)}
Local Sunrise #{julian_period_day_fraction_to_time(j_rise)}
Local Sunset #{julian_period_day_fraction_to_time(j_set)}
HEREDOC
text
