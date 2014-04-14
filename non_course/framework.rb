#framework.rb

class Matches
  def initialize(lhs)
    @lhs = lhs
  end
  
  def ==(rhs)
    result = (@lhs == rhs)
    print result ? 'true' : 'false'
  end
end

class Object
  def should
    Matches.new(self)
  end
end

def it(description)
  print "it #{description}: "
  yield
  puts
end

#~ it "knows how to add" do
  #~ (3 + 4).should == 7
  #~ (3 + 4).should == 6
#~ end
it("knows how to add (3 + 4).should == 7") {(3 + 4).should == 7}
it("knows how to add (3 + 4).should == 6") {(3 + 4).should == 6}