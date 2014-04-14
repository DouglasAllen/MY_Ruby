module Enumerable
  def sum_of_elements
    inject{|sum, element| sum + element}
  end
end
 
collection = ('a'..'f')
puts collection.sum_of_elements
