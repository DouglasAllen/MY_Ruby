class Object
  def should_equal(other)
    self == other
  end
end

def test_add
  (3 + 4).should_equal 7
end

puts test_add    
  