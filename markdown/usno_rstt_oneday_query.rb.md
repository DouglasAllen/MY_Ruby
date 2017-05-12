```ruby
require 'date'

require 'addressable/uri'
require 'json'
require 'rest-client'

lat = 41.95
lon = -88.75
tz = -6
date = Date.today.strftime('%m/%d/%Y')

uri = 'http://api.usno.navy.mil/rstt/oneday?'
query = "date=#{date}&coords=#{lat}N,#{lon.abs}W&tz=#{tz}"

addr = Addressable::URI.escape(uri + query)
rest_resource = JSON.parse(RestClient.get(addr))

if rest_resource['error'] == false

  sun_data = rest_resource.fetch('sundata')
  moon_data = rest_resource.fetch('moondata')
  closest_phase = rest_resource.fetch('closestphase')
  lunar_illumination = rest_resource.fetch('fracillum')
  lunar_phase = rest_resource.fetch('curphase')

  puts "Civil Twilight Start :  #{sun_data[0].fetch('time')}"
  puts "Sunrise              :  #{sun_data[1].fetch('time')}"
  puts "Noon                 :  #{sun_data[2].fetch('time')}"
  puts "Sunset               :  #{sun_data[3].fetch('time')}"
  puts "Civil Twilight End   :  #{sun_data[4].fetch('time')}"
  puts "Moonrise             :  #{moon_data[0].fetch('time')}"
  puts "Lunar Transit        :  #{moon_data[1].fetch('time')}"
  puts "Moonset              :  #{moon_data[2].fetch('time')}"
  puts "Closest Phase        :  #{closest_phase.fetch('phase')}"
  puts "Phase Date           :  #{closest_phase.fetch('date')}"
  puts "Phase Time           :  #{closest_phase.fetch('time')}"
  puts "Current Illumination :  #{lunar_illumination}"
  puts "Current Phase        :  #{lunar_phase}"
end
```