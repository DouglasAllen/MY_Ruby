
# http://viewsourcecode.org/why/hacking/seeingMetaclassesClearly.html

require 'metaid'
#
class MailTruck
  attr_accessor :driver, :route
  def initialize(driver, route)
    @driver = driver
    @route = route
  end
end

m = MailTruck.new('Harold', ['12 Corrigan Way', '23 Antler Ave'])
# => #<MailTruck:0x81cfb94 @route=["12 Corrigan Way", "23 Antler Ave"], @driver="Harold">
p m.class
# => MailTruck
p m.driver
# => "Harold"
p m.route
# => ["12 Corrigan Way", "23 Antler Ave"]
m.instance_variable_set('@speed', 45)
# (NoMethodError)
# p m.speed
# => seeing_metaclasses_clearly.rb:22:in `<main>': undefined method `speed' for #<MailTruck:0x0000000213bc38>
p m.instance_variable_get('@speed')

p m.object_id
p MailTruck.object_id

o = Object.new
p o.class
# => Object

p Class.superclass.superclass
# => Object

p Object.class
# => Class
p Object.superclass
# => nil
