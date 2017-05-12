Shoes.setup do
  #~ gem 'shoes-mocks'
  gem install 'rspec'
end

require 'spec/autorun'
  
  describe String, "#reverse" do
    it "should reverse the string" do
      "abcd".reverse.should == "dcba"
    end
  end
 
Shoes.app do
  Spec::Runner.run
end