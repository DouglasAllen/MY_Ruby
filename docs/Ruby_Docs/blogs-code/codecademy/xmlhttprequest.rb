#~ system 'gem install httparty'
#~ require 'httparty'

#~ response = HTTParty.get('http://twitter.com/statuses/public_timeline.json')
#~ puts response.body, response.code, response.message, response.headers.inspect

#~ system 'gem install mechanize'
require 'mechanize'

agent = Mechanize.new
agent.post 'http://www.example.com/', :foo => 'bar'