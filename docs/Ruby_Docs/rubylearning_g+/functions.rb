#~ module Functions
  #~ class Factorial
    #~ def self.get integer
      #~ raise ArgumentError, "Functions::Factorial.get does not accept null input." if integer.nil?
      #~ raise ArgumentError, "Functions::Factorial.get does not accept strings input." if integer.class == String 
      #~ i = integer       
      #~ if i >= 0               
        #~ i == 0 ? 1 : i * get(i-1) # using recursion
      #~ else
         #~ i == 0 ? -1 : i * get(i+1) # using recursion
      #~ end      
    #~ end
  #~ end
#~ end
module Functions
  class << self

    def factorial integer
      #~ raise ArgumentError, "Functions.factorial does not accept nulls as input." if integer.nil?
      #~ raise ArgumentError, "Functions.factorial does not accept strings as input." if integer.class == String 
      i = integer       
      if i >= 0               
        i == 0 ? 1 : i * factorial(i-1)    # using recursion
      else
         i == 0 ? -1 : i * factorial(i+1) # using recursion
      end
      rescue StandardError => e
        "invalid.  You gave me #{i.inspect} and we just can't deal with it."      
    end
    
    def fibinocci
    end

  end
end

input = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, nil, "doedoe"]
input.each do |i|
  fact = Functions.factorial i  
  puts "The Factorial of #{i} is #{fact}\n"
end

p Functions.class

#~ input = 0
#~ fact = Functions::Factorial.get input
#~ puts "The Factorial of #{input} is #{fact}\n"

#~ input = 5
#~ fact = Functions::Factorial.get input
#~ puts "The Factorial of #{input} is #{fact}\n"

#~ input = -5
#~ fact = Functions::Factorial.get input
#~ puts "The Factorial of #{input} is #{fact}\n"

#~ sprintf "The Factorial of {0} is {1}\n", %input, %fact
#~ printf("The Factorial of %d is %d\n", input, fact)