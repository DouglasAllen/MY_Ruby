file = <<'EOS'

Learning Ruby : class << self
25 Jun 2010

  A couple days ago I pointed out that learning ruby and rails wasn't trivial because of how different things are. 
Luckily I knew this before starting so roadblocks, while disappointing, aren't crushing. 
Today though I have some slightly better news as I feel that I've taken a small, but important step.

  I don't really understand how it happens, but everything in ruby is an object. 
You might think that everything in C# is a object, but that's only because you haven't seen ruby. 
What do I mean by that? Well, an instance is actually a class (or, more correctly if I properly understand ruby lingo, a metaclass), 
so you can actually go ahead and add methods to a specific instance, like so:

goku = Object.new
class << goku
   def power_level
       p "it's over 9000"
   end
end

And then, when you execute goku.power_level, you'll see it's over 9000. BUT, if you then do:

vegeta = Object.new
vegeta.power_level

You'll get an undefined_method error.

  Personally, I find this a pretty neat feature. 
Not so much because I can do neat Dragon Ball examples, but because its clearly very different than what I'm used to. 
To be completely honest, I'm not sure when you'd use this. 
Maybe my static language shackles are numbing my imagination. 
My take on it is pretty simple: there are probably some very specific low level cases where this comes in handy; 
however being able to define methods on instances isn't a specific feature they were after, but rather a side effect of the fundamental fact 
that everything in ruby truly is an object. In short class << XYZ is the way, in ruby, that one accesses a metaclass.

  The other thing that I've started getting more comfortable with is ruby's scope handling. 
In C# things are pretty straighforward (or maybe I'm just really used to it). 
The only tricky part are static members and variables - which we can largely consider as being on the global scope. 
This is all largely the same for ruby too, and unlike PHP (or at least the last time I did PHP), ruby's scope resolution is pretty flawless. 
However, the implementation between C# and ruby is very different, and that's because, as we saw above, everything's an object in ruby. 
In C# when you define an member or static member, you are doing so at the class definition level. 
In ruby, I'm pretty sure you are doing so on some instance.

So, when you do something like:

class User
   def change_status(new_status)
      ...
   end
   def self.find_by_email(email)  #static method (known as a class method in ruby)
      ...
   end
end

  you are actually adding those two members to two different instance to actual objects. 
This, I believe, is what makes ruby open to monkey patching and other amazing amount of flexibility. 
What I'm trying to get at is that a class isn't just a definition, its also a living object. 
The current scope, identified by self, is important, because that represents the object that defined members are being attached to.

Now, you can actually put this all together and do something like:

class User
   def change_status(new_status)
      ...
   end
   class << self
      def find_by_email(email)
      end
   end
end

  This is a syntax you'll likely run into often, so its important that you understand it. 
If nothing more, you can just see this as a shorthand way to declare static members - without having to prefix each member with self. 
While that's actually WHAT its doing, WHY it works is really what you should try to understand. 
Hopefully, if you've read all the way though, it makes a bit of sense. 
You are essentially modifying the the User object's (self) metaclass (class <<).

  If you are still confused, or possibly even more confused than before, I could have saved you a lot of trouble by simply suggesting that you
 read http://yehudakatz.com/2009/11/15/metaprogramming-in-ruby-its-all-about-the-self/

  So, am I close?
http://openmymind.net/2010/6/25/Learning-Ruby-class-self/

EOS

puts file