file = <<'EOS'

Better Ruby Idioms
November 12th, 2009

Carl and I have been working on the plugins system over the past few days. 
As part of that process, we read through the Rails Plugin Guide. 
While reading through the guide, we noticed a number of idioms presented in the guide that are serious overkill for the task at hand.

I don’t blame the author of the guide; the idioms presented are roughly the same that have been used since the early days of Rails. 
However, looking at them brought back memories of my early days using Rails, 
when the code made me feel as though Ruby was full of magic incantations and ceremony to accomplish relatively simple things.

Here’s an example:

module Yaffle
  def self.included(base)
    base.send :extend, ClassMethods
  end
 
  module ClassMethods
    # any method placed here will apply to classes, like Hickwall
    def acts_as_something
      send :include, InstanceMethods
    end
  end
 
  module InstanceMethods
    # any method placed here will apply to instaces, like @hickwall
  end
end

To begin with, the send is completely unneeded. 
The acts_as_something method will be run on the Class itself, giving the method access to include, a private method.

This code intended to be used as follows:

class ActiveRecord::Base
  include Yaffle
end
 
class Article < ActiveRecord::Base
  acts_as_yaffle
end

What the code does is:

Register a hook so that when the module is included, the ClassMethods are extended onto the class
In that module, define a method that includes the InstanceMethods
So that you can say acts_as_something in your code.
The crazy thing about all of this is that it’s completely reinventing the module system that Ruby already has. 
This would be exactly identical:

module Yaffle
  # any method placed here will apply to classes, like Hickwall
  def acts_as_something
    send :include, InstanceMethods
  end
 
  module InstanceMethods
    # any method placed here will apply to instances, like @hickwall
  end
end

To be used via:

class ActiveRecord::Base
  extend Yaffle
end
 
class Article < ActiveRecord::Base
  acts_as_yaffle
end

In a nutshell, there’s no point in overriding include to behave like extend when Ruby provides both!

To take this a bit further, you could do:

module Yaffle
  # any method placed here will apply to instances, like @hickwall, 
  # because that's how modules work!
end

To be used via:

class Article < ActiveRecord::Base
  include Yaffle
end

In effect, the initial code (override included hook to extend a method on, which then includes a module) 
is two layers of abstraction around a simple Ruby include!

Let’s look at a few more examples:

module Yaffle
  def self.included(base)
    base.send :extend, ClassMethods
  end
 
  module ClassMethods
    def acts_as_yaffle(options = {})
      cattr_accessor :yaffle_text_field
      self.yaffle_text_field = (options[:yaffle_text_field] || :last_squawk).to_s
    end
  end
end
 
ActiveRecord::Base.send :include, Yaffle

Again, we have the idiom of overriding include to behave like extend (instead of just using extend!).

A better solution:

module Yaffle
  def acts_as_yaffle(options = {})
    cattr_accessor :yaffle_text_field
    self.yaffle_text_field = options[:yaffle_text_field].to_s || "last_squawk"
  end
end
 
ActiveRecord::Base.extend Yaffle

In this case, it’s appropriate to use an acts_as_yaffle, since you’re providing additional options which could not be encapsulated 
using the normal Ruby extend.

Another “more advanced” case:

module Yaffle
  def self.included(base)
    base.send :extend, ClassMethods
  end
 
  module ClassMethods
    def acts_as_yaffle(options = {})
      cattr_accessor :yaffle_text_field
      self.yaffle_text_field = (options[:yaffle_text_field] || :last_squawk).to_s
      send :include, InstanceMethods
    end
  end
 
  module InstanceMethods
    def squawk(string)
      write_attribute(self.class.yaffle_text_field, string.to_squawk)
    end
  end
end
 
ActiveRecord::Base.send :include, Yaffle

Again, we have the idiom of overriding include to pretend to be an extend, and a send where it is not needed. 
Identical functionality:

module Yaffle
  def acts_as_yaffle(options = {})
    cattr_accessor :yaffle_text_field
    self.yaffle_text_field = (options[:yaffle_text_field] || :last_squawk).to_s
    include InstanceMethods
  end
 
  module InstanceMethods
    def squawk(string)
      write_attribute(self.class.yaffle_text_field, string.to_squawk)
    end
  end
end
 
ActiveRecord::Base.extend Yaffle

Of course, it is also possible to do:

module Yaffle
  def squawk(string)
    write_attribute(self.class.yaffle_text_field, string.to_squawk)
  end
end
 
class ActiveRecord::Base
  def self.acts_as_yaffle(options = {})
    cattr_accessor :yaffle_text_field
    self.yaffle_text_field = (options[:yaffle_text_field] || :last_squawk).to_s
    include Yaffle
  end
end

Since the module is always included in ActiveRecord::Base, there is no reason that the earlier code, 
with its additional modules and use of extend, is superior to simply reopening the class and adding the acts_as_yaffle method directly. 
Now we can put the squawk method directly inside the Yaffle module, where it can be included cleanly.

It may not seem like a huge deal, but it significantly reduces the amount of apparent magic in the plugin pattern, 
making it more accessible for new users. 
Additionally, it exposes the new user to include and extend quickly, instead of making them feel as though they were magic incantations 
requiring the use of send and special modules named ClassMethods in order to get them to work.

To be clear, I’m not saying that these idioms aren’t sometimes needed in special, advanced cases. 
However, I am saying that in the most common cases, they’re huge overkill that obscures the real functionality and confuses users.

This entry was posted on Thursday, November 12th, 2009 at 3:16 am	 and is filed under Rails 3, Ruby, Ruby on Rails. 
You can follow any responses to this entry through the RSS 2.0 feed. 
You can skip to the end and leave a response. Pinging is currently not allowed.
http://yehudakatz.com/2009/11/12/better-ruby-idioms/

EOS
puts file