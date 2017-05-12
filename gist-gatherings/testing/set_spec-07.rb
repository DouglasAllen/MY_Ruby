require 'rspec'
#require 'rspec/expectations'

here = File.dirname(__FILE__)
require "#{here}/my-set01"

describe "When Set.new(), set is empty" do

  subject {MySet.new()}
  
  it {is_expected.to be_empty}
  
end

describe "When Set.new().add(something), set is not empty" do
   
   subject {MySet.new.add("dog")}
   
   it {is_expected.to_not be_empty}

end