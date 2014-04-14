require 'singleton'

class AppConfig
  include Singleton
  attr_accessor :data
  def version
    '1.0.0'
  end
end

p AppConfig.instance
p AppConfig.instance
p ObjectSpace.each_object(AppConfig){}
AppConfig.instance.data = {enabled: true}
p AppConfig.instance.data
p AppConfig.instance.version
second = AppConfig.instance
second.data = {enabled: false}
p AppConfig.instance.data