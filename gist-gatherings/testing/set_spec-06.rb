require 'rspec'
here = File.dirname(__FILE__)
require "#{here}/my-set01"

describe "When MySet is initialized" do

  it "it should be empty" do
    @set = MySet.new
    @set.empty? == true
  end
  
end