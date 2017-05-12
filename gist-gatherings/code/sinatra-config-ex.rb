require "sinatra"
require "sinatra/config_file"

configure do
  environment = 'development'
  set :foo, "bar"
  config_file "settings.yml"                 # general settings
  config_file "#{environment}.settings.yml"  # environment specific settings
  #foo # => "bar" (no matter what you put in your config file)
end
