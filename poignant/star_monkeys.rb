filename = 'data.txt'
$:.unshift(File.expand_path(File.dirname(__FILE__)))
require 'code_words'

p @code_words.[]( 'catapult' )

temp = []
data = File.readlines(filename)
data.each {|line| temp << line.split('\",\"')}
idea = temp.join
puts "File before swap:"
puts File.readlines(filename)
#~ @code_words = {
#~ 'starmonkeys' => 'Phil and Pete, those prickly chancellors of the New Reich',
#~ 'catapult' => 'chucky go-go', 'firebomb' => 'Heat-Assisted Living',
#~ 'Nigeria' => "Ny and Jerry's Dry Cleaning (with Donuts)",
#~ 'Put the kabosh on' => 'Put the cable box on'
#~ }

@code_words.each do |real, code|
  idea.gsub!( real, code )
end

# Save the jibberish to a new file
#~ print "File encoded. Please enter a name for this idea: "
idea_name = ""#gets.strip
File::open( "idea-" + idea_name + ".txt", "w" ) do |f|
f << idea
end

puts
p @code_words.[]( 'catapult' )
puts "New file after word swap:"
puts File.readlines("idea-" + idea_name + ".txt")

puts
p @code_words.[]( 'catapult' )
# Print each idea out with the words fixed
Dir['idea-*.txt'].each do |file_name|
  idea = File.read( file_name )
  @code_words.each do |real, code|
    idea.gsub!( code, real )
  end
  puts idea
end

p File::methods