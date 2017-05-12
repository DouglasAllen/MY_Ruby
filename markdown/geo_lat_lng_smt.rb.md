
```ruby
# geo_lat_lng_smt.rb

require 'multi_xml'
require 'rest-client'

# class for Google Geo location lookup
class GeoLatLng
  attr_accessor :addr, :base, :default, :lat, :lng

  def base
    'http://maps.googleapis.com/maps/api/geocode/xml?sensor=false&address='
  end

  def initialize
    @addr            = nil
    @base_google_url = base
    @default         = '3333 Coyote Hill Road, Palo Alto, CA, 94304, USA'
    @lat             = 0.0
    @lng             = 0.0
    MultiXml.parser = :rexml #:libxml#:ox # :nokogiri
  end

  attr_writer :addr

  def get_coordinates_from_address
    res = RestClient.get(
      URI.encode(
        "#{@base_google_url}#{@addr}"
      )
    )
    parsed_res = MultiXml.parse(res)
    result     = parsed_res['GeocodeResponse']['result']
    status     = parsed_res['GeocodeResponse']['status']
    if status != 'OK'
      @default
    else
      if result.count != 4
        @default
      else
        @lat   = parsed_res['GeocodeResponse']['result']['geometry']['location']['lat']
        @lng   = parsed_res['GeocodeResponse']['result']['geometry']['location']['lng']
      end
    end
  end
end
```
