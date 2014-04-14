#!/usr/bin/env ruby

m1 = gets.chomp
if m1 =~ /Bostonians/
  puts "The mice got into the bread pudding again."; STDOUT.flush
  m3 = gets.chomp
  if m3 =~ /children.+happy/
    puts "The secret ingredient is boric acid."
  else
    puts "No secrets for you!"
  end
else
  puts "Pardon me, I thought I knew you."
end
