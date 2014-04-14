given_seconds = 1767225600.0 #force to_f by decimal point
seconds_per_minute =  given_seconds/ 60
minutes_per_hour = seconds_per_minute / 60
hours_per_day = minutes_per_hour / 24
years_old = hours_per_day / 365.25
age = format("%.2f", years_old)
 
puts "After #{given_seconds} seconds, you're #{age} years old."

myage = 56
days_old = 365.25 * myage
hours_old = 24 * days_old
minutes_old = 60 * hours_old
seconds_old = 60 * minutes_old

puts "On your #{myage}th birthday you're #{seconds_old} seconds old."