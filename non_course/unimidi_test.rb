#!/home/kb9agt/.rvm/wrappers/default/ruby
$:.unshift File.join( File.dirname( __FILE__ ), '../lib')

require 'unimidi'
require 'pp'

notes = [36, 40, 43, 48, 52, 55, 60, 64, 67] # C E G arpeggios
duration = 0.1

pp UniMIDI::Device.all_by_type 
