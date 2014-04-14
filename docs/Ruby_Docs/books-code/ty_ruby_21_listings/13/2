#!/usr/bin/env ruby

companion = IO.popen("ruby spy2.rb","w+")

companion.puts "What are Bostonians wearing this winter?"
m2 = companion.gets.chomp
if m2 =~ /bread pudding/
  companion.puts "Your children must be very happy."
  secret = companion.gets.chomp
else
  companion.puts "Pardon me, I thought I knew you."
end

puts "Mission accomplished: #{secret}"
companion.close
