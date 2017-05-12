#!/usr/bin/ruby

# get_USNO_times.rb
# Murtaza Gulamali (11/10/2011)
#
# Get sunrise/sunset times for random locations and random dates from the
# USNO website, and write them to a file in CSV format.  Timezone information
# is obtained from AskGeo.

require 'date'
require 'rubygems'
require 'mechanize'
require 'tzinfo'
require 'json'
require 'net/http'
require 'uri'
require 'addressable/uri'
require 'rest-client'

# repeat this many times
n = 10

# output filename
filename = 'random_data.csv'

def random_date
  # return random date between 01/01/1700 and 31/12/2100
  ajd = rand(2_488_433 - 2_341_972) + 2_341_972.5
  Date.new(ajd)
end

def random_location
  # return random location between lat = ±82 degrees and lon = ±180 degrees
  lat = rand * 164.0 - 82.0
  lon = rand * 360.0 - 180.0
  {
    'lat' => lat,
    'lon' => lon
  }
end

def timezones# (dates, lats, lons)
  # return list of timezones for specified list of
  # dates and corresponding locations
  # max_pts = 4
  # timezones = []
  # base_url = 'http://api.askgeo.com/v1'
  # account_id = '1738'
  # api_key = '7f33e4f2a928bc460cbb997fe3b5cb0b30fc7abebe16422e6b267989f80297d0'
  # url = "#{base_url}/#{account_id}/#{api_key}/query.json?points="
  # query = "41.95,-88.75;databases=Astronomy"
  # addr = Addressable::URI.escape(url + query)
  # rest_resource = JSON.parse(RestClient.get(addr))
  # puts rest_resource
# system 'C:\Progra~2\google\Chrome\Application\chrome.exe http://api.askgeo.com/v1/1738/7f33e4f2a928bc460cbb997fe3b5cb0b30fc7abebe16422e6b267989f80297d0/query.json?points=41.95,-88.75;databases=Astronomy;data=TodaySunriseIso8601'
  # "https://api.askgeo.com/v1/1738/7f33e4f2a928bc460cbb997fe3b5cb0b30fc7abebe16422e6b267989f80297d0/query.json?points=37.78%2C-122.42%3B40.71%2C-74.01&# databases=Point%2CTimeZone%2CAstronomy%2CNaturalEarthCountry%2CUsState2010%2CUsCounty2010%2CUsCountySubdivision2010%2CUsTract2010%2CUsBlockGroup2010%2CUsPlace2010%2CUsZcta2010"
  # (0..(dates.length / max_pts)).each do |i| # iterate over groups of points
  #   pts = []
    # iterate over points
  #   ((i * max_pts)..[(i + 1) * max_pts - 1, dates.length - 1].min).each do |j|
  #     pts.push("#{lats[j]},#{lons[j]}")
  #   end
    # make request to AskGeo
  #   resp = Net::HTTP.get_response(URI.parse(url + pts.join(';')))
  # resp = Net::HTTP.get_response(URI.parse(url + "41.95%2C-88.75&databases=Astronomy&data="))
  #   p result = JSON.parse(resp.body)
    # raise 'web service error' if result.key?('Error')
    # parse response to obtain time zone information
  #   (0...(result['data'].length)).each do |j|
  #     timezones.push('desc' => result['data'][j]['timeZone'],
  #                    'offset' => result['data'][j]['currentOffsetMs'] /
  #          3_600_000.0)
  #   end
  # end
  # get offset for specified dates (just in case DST is required)
  # (0...(dates.length)).each do |i|
  #   tz = TZInfo::Timezone.get(timezones[i]['desc'])
  #   timezones[i]['offset'] =
  #     tz.period_for_local(DateTime.new!(dates[i].ajd)).utc_total_offset / 3600.0
  # end
  # return result
  # timezones
end
timezones
@dictionary =
  %w(FFX => 2
     ID => AA
     xxy => date.year.to_s
     xxm => date.month.to_s
     xxd => date.day.to_s
     place => (blank)
     xx0 => (lon < 0 ? -1 : 1')
     xx1 => lon.abs.floor
     xx2 => ((lon.abs - lon.abs.floor) * 60.0).floor
     yy0 => (lat < 0 ? -1 : 1')
     yy1 => lat.abs.floor
     yy2 => ((lat.abs - lat.abs.floor) * 60.0).floor
     zz0 => (offset < 0 ? -1 : 1')
     zz1 => offset.abs
     ZZZ => END)

def formfields(_date, _lat, _lon, _offset)
  # return dictionary of form fields given specified parameters
  @dictionary
end

# --------------------------------- MAIN BLOCK ---------------------------------

# create arrays of random dates and locations
dates = []
lats = []
lons = []
(1..n).each do
  dates.push(random_date)
  loc = random_location
  lats.push(loc['lat'])
  lons.push(loc['lon'])
end

# determine timezone for each date and location
# tzs = timezones(dates, lats, lons)

# open new CSV file
of = File.new(filename, 'w')
of.write("Year,Month,Day,Lat,Lon,Timezone,Offset,
  Begin civil twilight,Sunrise,Sun transit,Sunset,End civil twilight\n")
# (0...n).each do |i| # loop over number of dates and locations
#   fields = formfields(dates[i], lats[i], lons[i], tzs[i]['offset'])
#   of.write("#{dates[i].year},
            #{dates[i].month},
		      	#{dates[i].day},
			      #{lats[i]},
		        #{lons[i]},
			      #{tzs[i]['desc']},
			      #{tzs[i]['offset']},")
  # setup Mechanize
  # agent = Mechanize.new { |a| a.user_agent_alias = 'Mac Safari' }
  # submit form
  # page = agent.post('http://aa.usno.navy.mil/cgi-bin/aa_pap.pl', fields)
  # page = agent.post('http://api.usno.navy.mil/', fields)
  # find everything within the <PRE> tags
  # lines = page.search('pre').children.inner_text.split("\n")
  # lines.each do |line| # loop over lines
  #   next unless line.index('Begin civil twilight') ||
  #               line.index('Sunrise') ||
  #               line.index('Sun transit') ||
  #               line.index('Sunset') ||
  #               line.index('End civil twilight')

  #   separator = if !line.index('End civil twilight')
  #                 ','
  #               else
  #                 ''
  #               end
    # write times to file
  #   of.write(line.split(' ').last + separator)
  # end
  # of.write("\n")
# end
# uri: URI.parse("http://api.usno.navy.mil/rstt/oneday?")
