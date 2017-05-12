require 'rspec'
here = File.dirname(__FILE__)
require "#{here}/my-set01"

describe "When Set is initialized" do

  before do
    @set = Set.new
  end
  
  it "it should be empty" do
    expect(@set.empty?).to equal true
  end
  
end