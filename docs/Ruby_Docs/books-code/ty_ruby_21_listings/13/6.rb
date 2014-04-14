#!/usr/bin/env ruby

fork do
  # child code
  sleep 0.5
  2.step(10,2) do |num|
    puts " Child says #{num}"
    sleep 1
  end
end

# parent code
1.step(9,2) do |num|
  puts "Parent says #{num}"
  sleep 1
end
Process.wait
