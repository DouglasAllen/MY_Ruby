require 'uri'
require 'open-uri'


#~ newuri = URI::HTTP.build({:host => 'herokuapp.com', :path => ''})
#~ puts newuri

#~ doc = open(newuri) 

url = 'http://equationoftime.herokuapp.com/'
doc = open(url) 

data = <<EOT

#{doc.readlines.join}

EOT

puts data