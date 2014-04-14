Shoes.setup do
	gem 'equation_of_time'
end
    require 'equation_of_time'
eot = Equation_of_Time.new()
window :width => 400, :height => 400 do
  background black
  
  stack do    	
  	# Time.now is a Synonym for Time.new()
  	para "Time now is #{Time.new().utc}", :stroke => white
  	
  	delta_t = eot.equation_of_time
  	message = "Equation of Time = "
    para message + eot.display_equation_of_time(delta_t), :stroke => white

  end  
end