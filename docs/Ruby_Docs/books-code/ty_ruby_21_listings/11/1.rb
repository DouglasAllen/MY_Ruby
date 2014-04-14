module Consumable
  attr_accessor :capacity, :used

  def remaining
    @capacity - @used
  end

  def finished
    @used >= @capacity
  end

  def room_for?(x)
    @used + x <= @capacity
  end

  def consume(x)
    @used += x
  end
end

class RecordingMedium

  include Consumable

  def initialize
    self.used = 0
    @tracks = []
  end

  def record(title,duration)
    if room_for?(duration)
      @tracks.push(title)
      consume(duration)
      return true
    else
      return false
    end
  end
end

class CD < RecordingMedium

  def initialize
    self.capacity = 70
    super
  end
end

# Some test cases:

cd = CD.new
if cd.record("Minute Waltz", 1)
  puts "Recorded the Minute Waltz"
else
  puts "Couldn't record the Minute Waltz"
end

if cd.record("Messiah", 120)
  puts "Recorded Messiah"
else
  puts "Couldn't record Messiah"
end
