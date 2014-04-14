require 'green_shoes'

Shoes.app do self
  self.stack do
    self.para "#{self}"
    #~ methods = self.methods
    self.para "#{self.methods}"    
    self.para "#{self.class}"
    self.para "#{self.class.ancestors}" 
     #~ self.para "#{self.instance_eval("class<< self;self;end")}"
     #~ self.para "Second"
     #~ self.para "Third"
  end
end