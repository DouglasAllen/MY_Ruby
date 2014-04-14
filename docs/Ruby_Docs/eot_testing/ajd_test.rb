require 'date'
require 'equation_of_time'

class TestAJD
	def initialize(ajd=nil)
		@ajd = ajd
	end	
	def ajd
		@ajd
	end
	def ajd= (date = nil)
		@ajd = date.ajd
	end
end

tajd = TestAJD.new
p tajd.ajd.class

eot = Equation_of_Time.new
p eot.ajd.class