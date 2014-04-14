# rlcr_w04_ex05.rb

#Exercise5. Difficulty level: MEDIUM Write a one-line Ruby script that displays on the screen all the files in the current folder 
#as well as everything in all its sub folders, in sorted order.

# Make use of Dir.glob method as follows:
#Dir.glob('**/*')
#Name this program inventory.rb.

#puts Dir.glob('**/*').sort
#puts Dir.[]

system 'ruby -e \'puts Dir.glob("**\*").sort\''


