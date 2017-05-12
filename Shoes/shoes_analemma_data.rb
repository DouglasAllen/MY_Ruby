# compare to data here in menu http://equationoftime.herokuapp.com/alex oops! ;-)
# analemma_data.rb
Shoes.setup do
  gem 'eot'
end
require 'eot'
eot = Eot.new()
start = "2012-1-1"
start_date = Date.parse(start).jd
finish = "2012-12-31"
finish_date = Date.parse(finish).jd

window do
  stack do
    para "Today is " + Date.today.to_s
    para "Start Date = #{start}"
    para "Finish Date = #{finish}"
    para "Date\t\t Delta Time\t\t Declination Degrees"
    # use the range
    #for jd in start_date..finish_date
    (start_date..finish_date).each do |jd|    
      date = Date.jd(jd).to_s
      eot.ajd = jd
      eot.ma_ta_set
      # depricated 
      # timejc = eot.time_julian_centurey(jd)
      timejc = eot.ta
      # depricated    
      # equation_of_time = eot.equation_of_time(timejc)
      equation_of_time = eot.eot
      # depricated    
      # degrees_declination = eot.declination(timejc)
      degrees_declination = eot.declination
      # depricated
      # delta_t = eot.display_equation_of_time(equation_of_time)
      delta_t = eot.string_eot
      declination = eot.degrees_to_s(degrees_declination)
      # similar to
      # puts "#{date}\t  #{delta_t}\t  #{declination}"
      para "#{date}\t  #{delta_t}\t  #{declination}"
    end
  end
end
