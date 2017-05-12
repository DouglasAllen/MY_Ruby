kitty_toys =
[:shape => 'sock', :fabric => 'cashmere'] +
[:shape => 'mouse', :fabric => 'calico'] +
[:shape => 'eggroll', :fabric => 'chenille']
puts kitty_toys.sort_by { |toy| toy[:fabric] }
puts

kitty_toys = [
{:shape => 'sock', :fabric => 'cashmere'},
{:shape => 'mouse', :fabric => 'calico'},
{:shape => 'eggroll', :fabric => 'chenille'}
]

kitty_toys.sort_by { |toy| toy[:shape] }.each do |toy|
  puts "Blixy has a #{ toy[:shape] } made of #{ toy[:fabric] }"
end
puts

non_eggroll = 0
kitty_toys.each do |toy|
  next if toy[:shape] == 'eggroll'
  non_eggroll = non_eggroll + 1
end
puts non_eggroll
puts

kitty_toys.each do |toy|
  break if toy[:fabric] == 'chenille'
  p toy
end