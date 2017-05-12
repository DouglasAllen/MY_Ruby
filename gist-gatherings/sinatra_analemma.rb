
require 'sinatra'
require 'eot'

get '/' do
  eot = Eot.new
  @start = '2012-1-1'
  @start_date = Date.parse(@start).jd
  @finish = '2012-12-31'
  @finish_date = Date.parse(@finish).jd
  data = []
  (@start_date..@finish_date).each do |jd|
    date = Date.jd(jd).to_s
    eot.jd = jd
    eot.set_t
    delta_t = eot.display_equation_of_time
    declination = eot.degrees_to_s(eot.declination)
    ds = (date + ' ' + delta_t + ' ' + declination).split
    data << '<p>' + ds.join(' / ') + '</p>'
  end
  ds = data.join

  "<html>
    <body>
      <p><b>Analemma Data for</b></p>
      <p>Start date = #{@start} = #{@start_date}</p>
      <p>Finish date = #{@finish} = #{@finish_date}</p>
      <p>Date / Delta / Declination</p>
      #{ds}

    </body>
  </html>"
end
