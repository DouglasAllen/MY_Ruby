
p 5.methods
p 5.class
p 5.methods.class
#
class Array
  def sum
    inject(nil) { |sum, x| sum ? sum + x : x }
  end

  def average
    sum.to_f / size
  end
end

puts [1, 2, 3, 4, 5, 6].average
#
class Song
  attr_reader :title, :who, :duration
  def initialize(title, who, duration)
    @title = title
    @who = who
    @duration = duration
  end

  include Comparable
  def <=>(other)
    duration <=> other.duration
  end
end

song1 = Song.new('My Way', 'Sinatra', 225)
song2 = Song.new('Bicylops', 'Fleck',  260)
p song1 <=> song2 #=>  -1
p song1 < song2   #=>  true
p song1 == song1  #=>  true
p song1 > song2   #=>  false

# http://blog.mostof.it/why-ruby-part-one-a-classy-class-system/
