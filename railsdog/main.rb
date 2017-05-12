 #main.rb

require_relative 'foo'
puts $LOADED_FEATURES
require_relative 'foo'# not loaded twice
puts $LOADED_FEATURES