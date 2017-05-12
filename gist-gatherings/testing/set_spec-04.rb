require 'rspec'

require 'set'

describe "When Set is initialized" do

  before do
    @set = Set.new
  end

  it "it should be empty" do
    @set.empty? == true
  end
  
end