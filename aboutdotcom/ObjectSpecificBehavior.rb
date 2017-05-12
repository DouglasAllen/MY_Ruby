#!/usr/bin/env ruby
# http://ruby.about.com/od/oo/ss/Object-Specific-Behavior.htm


class Person
  def initialize(name)
    @name = name
  end

  def say_hello
    puts "Hello, I am #{@name}"
  end
end
puts "Person class has these ancestors: #{Person.ancestors}"
puts

# a mixin module called Juggler
module Juggler
  def juggle
    puts "Look at me!  I'm a juggler!"
  end
end

alice = Person.new('Alice')
alice.say_hello
p class <<alice; self; end
p alice.singleton_class
p alice.singleton_methods
p alice.singleton_class.ancestors

# alice.juggle  # Alice cannot, will raise exception

bob  = Person.new('Bob')
bob.say_hello
p class <<bob; self; end
p bob.singleton_class
bob.extend(Juggler)
bob.juggle   # Bob can juggle
p bob.singleton_methods
p bob.singleton_class.ancestors

# Bob's singleton class using the special class syntax
class <<bob
  def juggles
    puts "Bob juggles three colored balls"
  end
end

bob.juggles   # Bob can juggle
p bob.singleton_methods
p bob.singleton_class.ancestors



  