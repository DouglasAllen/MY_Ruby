

require 'green_shoes'
require 'eot'

Shoes.app height: 600, width: 800, title: 'Shoes Analemma Data' do
  eot = Eot.new
  start = Date.parse('2016-1-1').jd
  finish = Date.parse('2016-12-31').jd
  data = []
  (start..finish).each do |jd|
    date = Date.jd(jd).to_s
    eot.jd = jd
    eot.set_t
    delta_t = eot.display_equation_of_time
    declination = eot.degrees_to_s(eot.declination)
    ds = ("\t" + date + "\t " + delta_t + "\t " + declination)
    data << ds
  end
  stack do
    para "\n\tShoes shows Eot data"
    para "\n\tToday is " + Date.today.to_s
    para "\tStart Date = #{start}"
    para "\tFinish Date = #{finish}\n"
    para "\tDate\t\t\t Eot Delta\t\t Declination"
    data.each { |line| para line }
  end
end
