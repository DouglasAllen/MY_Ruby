file = <<'EOS'
Ruby Metaprogramming: Declaratively Adding Methods to a Class
Submitted by: Mark on Mon, 2008-01-28 03:36.
Categories: Metaprogramming | Ruby

In this brief piece I will examine Ruby's support for metaprogramming and how to define class level methods 
that add instance methods to our class implementations at run time.

Over the past few months I've been learning Ruby on Rails. 
One of the most attractive features of Rails its declarative style of defining relationships and validations on models; and filters on actions.

A simple example of this declarative style:

class Party < ActiveRecord::Base
  has_many :addresses
end
This class defines a Party model that can have many addresses. The simple "has_many :addresses" declaration is a great example of the power of Ruby. This simple statement adds a number of methods to our Party class, and allows us to easily manage relationships between our parties and their addresses.

How does it do so much with one simple line of code? The secret is Ruby's open classes, the fact that classes definitions are executable code, everything in Ruby is an expression and its support for metaprogramming.

Open Classes
For those coming from static object oriented languages, such as C++ and Java, the concept of open classes is quite foreign. What does it mean that Ruby has open classes? It means that at run time the definition of a class can be changed. All classes in Ruby are open to be changed by the user at all times.

Let's say your program needs to calculate factorials of integers on a regular basis. Wouldn't it be nice if we could just add a method to do this to the Integer class? Well, we can.

i = 10

puts i

class Integer < Numeric
  def factorial
    my_i = self.to_i
    if my_i <= 0
      result = 0
    else 
      result = 1
      my_i.downto(2) do |n|
        result = result * n
      end
    end
    result
  end
end
    
puts i.factorial
In this listing we define i as an Integer with a value of 10. Then we reopen the Integer class and add a factorial method (Please don't be critical I'm not a mathematician, and I'm not even sure that's a correct implementation of factorial, but it gets the point across.), then we call the factorial method on i.

The important thing to note here is that we were able to add a method to an existing class, and use it on an instance of that class that preexisted our change to the Integer class.

Classes Definitions are Executable Code
In Ruby class definitions are expressions, just like "i = 1". Which means that class definitions are executed. This is what makes the "has_many :addresses" in our example work. It also means that class definitions return a value, just like methods can.

Let's take a look at an example.

a = class A
end

puts a
puts a.class
puts

b = class B
  self
end

puts b
puts b.class
puts

c = class C
  1
end

puts c
puts c.class
puts
If we run our example we'll get the following out:

nil
NilClass

B
Class

1
Fixnum
What's that all mean? It means is that class definitions are evaluated expressions just like any other Ruby code. They just create class definitions as they run. The important thing is they are evaluated code. This is different than Java class definitions that are compiled and then used to create new instances from static definitions. Ruby class declarations are evaluated, that's what gives them their power and expressiveness.

So, what can we do with the fact that class definitions are evaluated.

class A
  puts "Opening class A"
  
  def say_hello
    puts "Hello"
  end
end

a = A.new
a.say_hello
Running this example we see the following output:

Opening class A
Hello
Metaprogramming
Now, knowing that Ruby class definitions are evaluated at run time, we can enter the real world of metaprogramming. Using simple hooks that are available in the Module class, the immediate super-class of Class, we will create methods in our class definition at runtime.

An example:

class Talker

  [:hello, :good_bye].each do |arg|
    method_name = ("say_" + arg.to_s).to_sym
    send :define_method, method_name do
      puts arg
    end
  end

end


t = Talker.new
t.say_hello
t.say_good_bye
Running this script will give us the following output:

hello
good_bye
So, what happened? Iterating over an array of symbols we create a method prepending "say_" to the symbol and outputting the symbol to standard out with puts. The magic line in the example is:

send :define_method, method_name do
This line of code calls the send method with the message :define_method passing it method_name as the name of the method. Ruby being a completely object oriented language you might be wondering what object is being sent the :define_method message? In this case the message is being sent to self. (Although all messages are sent to self, but that's a post for another time.) But what does self refer to? In this context it refers to the Class instance that defines Talker. (To see that self is the Talker class add a "puts self" inside the class definition.)

Creating Methods Declaratively
So, how does Rails do the magic behind "has_many :addresses"? Metaprogramming. We now have the building block that will allow us to do the same using the fact that class definitions are evaluated expressions, classes are open and using Module#define_method.

Our first iteration will use a parent class that will provide the hook to create methods declaratively.

class Talker
  def self.say(*args)
    puts "Inside self.say"
    puts "self = #{self}"
    args.each do |arg|
      method_name = ("say_" + arg.to_s).to_sym
      send :define_method, method_name do
        puts arg
      end
    end
  end
end

class MyTalker < Talker
  say :hello
end

m = MyTalker.new

m.say_hello
Class Talker defines a class method say, that takes a variable number of arguments, iterates over each one and creates a method using the same methodology as our previous example. Class MyTalker extends Talker calling the say method passing it :hello. This results in the method say_hello being added to our MyTalker class definition.

Now we will extend this one step further by creating a descendant of MyTalker that also says ouch.

class OuchTalker < MyTalker
  say :ouch
end

ouch = OuchTalker.new
ouch.say_ouch
ouch.say_hello
Because OuchTalker extends MyTalker it automatically inherits all of the methods of MyTalker including say_hello, even though say_hello was declaratively created at evaluation time. Now, add some code to instantiate a Talker object and try calling say_hello on it. You will get a NoMethodError.

A Further Iteration: Moving Talker to a Module
For our final iteration of Talker and MyTalker we will move the functionality provided by Talker, adding say methods to a class definition declaratively, to a module so it can be mixed into any class. Moving this functionality to a module makes it easier to re-use. Your classes don't need to inherit from Talker to get the benefits of the functionality. This pattern is used repeatedly in the Rails code. (For example see activerecord/lib/active_record/validations.rb.)

module Talker
  
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def say(*args)
      args.each do |arg|
        method_name = ("say_" + arg.to_s).to_sym
        send :define_method, method_name do
          puts arg
        end
      end
    end
  end
  
end

class MyTalker
  include Talker
  say :hello
end

m = MyTalker.new

m.say_hello

class OuchTalker < MyTalker
  say :ouch
end

ouch = OuchTalker.new
ouch.say_ouch
ouch.say_hello
The key pattern or construct here is two fold. Talker now includes an implementation of Module#included, which is a class/module method. Module#included is passed a reference to the Class it is being mixed into. This allows included to hook into the runtime, in our example we use this to extend the Class we're being mixed into with the methods from the Talker::ClassMethods module. This has the effect of making "say" a class method of the classes it is mixed into.

So, if you want to create a module that adds class methods to the class it is mixed into you can do the following:

module YourModule
  
  def self.included(base) # :nodoc:
    base.extend ClassMethods
  end

  module ClassMethods
    # Define class methods here.
    def some_class_method
      puts "In some_class_method"
    end
  end
  
  def some_instance_method
    puts "some_instance_method"
  end
  
end

class YourClass
  include YourModule
end

YourClass.some_class_method

y = YourClass.new
y.some_instance_method
That's it for now. This is a lot to digest, and it took me a while to wrap my head around it all. 
The most important issue is knowing at any point in your code what self is referencing. 
I will post more about that, but when in doubt just add a "puts self; puts self.class" to your code and see what it is. You'll learn a lot. And remember class definitions are just executable code.
http://www.vitarara.org/cms/ruby_metaprogamming_declaratively_adding_methods_to_a_class
EOS

puts file