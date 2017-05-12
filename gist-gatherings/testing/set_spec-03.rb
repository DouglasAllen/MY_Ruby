require 'rspec'

require File.expand_path '../my-set01.rb', __FILE__

describe "MySet.new()" do

  it "empty? should be true" do
    expect(MySet.new.empty?).to equal true
  end

end