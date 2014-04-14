# analemma_data.rb
require 'equation_of_time'

start = "2012-7-1"
finish = "2012-12-31"

puts Date.today.to_s
start_date = Date.parse(start).jd
finish_date = Date.parse(finish).jd
puts "start julian date = #{start_date}"
puts "finish julian date = #{finish_date}"

eot = Equation_of_Time.new()
for jd in start_date..finish_date    
    date = Date.jd(jd).to_s
    timejc = eot.time_julian_centurey(jd)    
    equation_of_time = eot.equation_of_time(timejc)    
    degrees_declination = eot.declination(timejc)
    delta_t = eot.display_equation_of_time(equation_of_time)
    declination = eot.display_degrees(degrees_declination)
    puts "#{date}  #{delta_t}  #{declination}"
end

