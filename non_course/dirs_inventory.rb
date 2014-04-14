# rlcr_w04_ex05.rb

#Exercise5. Difficulty level: MEDIUM Write a one-line Ruby script that displays on the screen all the files in the current folder 
#as well as everything in all its sub folders, in sorted order.

# Make use of Dir.glob method as follows:
#Dir.glob('**/*')
#Name this program inventory.rb.

File.open('inventory.rb', mode='w') do |f|
	f << Dir.glob('**/*').sort
	#~ f.each {|line| puts line}
end

#~ File.open('inventory.txt', mode='r') do |lines|
	#~ lines.each {|line| puts line.split(",")}
#~ end
#~ puts Dir.[]

#~ system 'ruby -e \'puts Dir.glob("**\*").sort\''
#~ require_relative 'inventory'
inventory = []
File.open('inventory.rb', mode='r') do |f|	
	inventory << f.readlines
end
inventory.each {|item| puts item.class }
inventory.each {|item| puts item }