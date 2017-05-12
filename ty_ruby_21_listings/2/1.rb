#!/usr/bin/env ruby

   # Define a top-level method.
   def foo
     puts "The foo method has been called!"
   end
   
   # Create an object "ob1", give it a method "call_foo",
   #  and let that method call foo.
   ob1 = Object.new
   def ob1.call_foo
     foo
   end
   
   # As above, but instead of a single object, define
   #  a class and make a couple of instances of it.
   class FooCaller
     def call_foo
       foo
     end
   end
   
   fc1 = FooCaller.new
   fc2 = FooCaller.new
   
   
   # Demonstrate that each object has access to
   #  the foo method.
   
   print "self: " ;   foo
   print "ob1:  " ;   ob1.call_foo
   print "fc1:  " ;   fc1.call_foo
   print "fc2:  " ;   fc2.call_foo




