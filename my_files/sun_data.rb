require 'net/http'
require 'uri'
require 'nokogiri'
require 'csv'
require 'date'

def get_data(month:,day:,year: 2016)
  print "\e[32m.\e[m"
  uri = URI.parse("http://aa.usno.navy.mil/rstt/onedaytable?ID=AA&year=#{year}&month=#{month}&day=#{day}&state=DC&place=Portage%2C+IN")
  response = Net::HTTP.get_response(uri)
  page = Nokogiri::HTML(response.body)
  tds = page.css('table')[1].css('td')

  date = Date.new(year, month, day).strftime("%b-%d")
  sunrise = tds[3].text
  sunset = tds[7].text

  [date, sunrise, sunset]
end

def get_dates(start_date:,end_date:)
  date = start_date

  sun_data = []
  while date <= end_date do
    sun_data << date
    date = date.next
  end

  sun_data
end

dates = get_dates(start_date: Date.new(2016,1,1), end_date: Date.new(2016,12,31))
CSV.open("sun_timetables.csv", "w") do |csv|
  csv << ["date", "sunrise", "sunset"]
  dates.each do |date|
    csv << get_data(month: date.month, day: date.day)
  end
end

puts "\nDone.\n"
