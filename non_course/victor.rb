module Doug
    
	print ("\n")
	print ("This is simply module Doug loaded.\n\n")
   
	class Doug
      Doug = "This is a constant Doug inside Doug class inside Doug module.\n\n"
      print ("This is a module level Class Doug.\n\n")      
	end
  
end
 
#~ print (Doug::Doug::Doug)
  
module Vic
 
  class Doug    
    print ("This is Doug class inside Vic Module.\n\n")     
  end
    
end
 
class Douglas
   Doug = "This is a constant Doug inside Douglas class.\n\n"
   print "This is class Douglas.\n\n"
end 

#~ print (Douglas::Doug)


print ("Normally we would 'require' or 'load' separate files for this...\n") 
print ("include Doug\n\n")
print ("but this is simple enough to demonstrate.\n\n")
print ("extend Doug  #include and extend does two different things.\n\n")
print ("\n")
