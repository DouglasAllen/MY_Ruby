file = <<'HERE'

Ruby stores instance method definitions and class variables in “normal” class object, while overrides singleton class methods in Object’s metaclass (a.k.a. class’s meta-object).
Think of Ruby’s metaclass as “a class which an object uses to redefine itself.”

Assuming the above metaclass helpers have been defined:
HERE

puts file

class Object
    # The hidden singleton lurks behind everyone
    def metaclass; class << self; self; end; end
    def meta_eval &blk; metaclass.instance_eval &blk; end

    # Adds methods to a metaclass
    def meta_def( name, &blk )
      meta_eval { define_method name, &blk }
    end

    # Defines an instance method within a class
    def class_def( name, &blk )
      class_eval { define_method name, &blk }
    end
  end

  class A
    @class_instance_var = "a class instance variable"
    @@class_var = "a class variable"
  
    def self.instance_var
      @class_instance_var  # not accessible by subclass
    end
  
    def self.class_var 
      @@class_var   # accessible by subclasses
    end 
  
    def foo
      'an instance method'
    end
  end

 p A.instance_var  # => "A class instance variable"
 p A.class_var     # => "A class varaible"
  
  # note: Module#intance_methods only is only availabe in class objects since Class mixed in Module (but not Object).
  # class methods are defined in metaclass 
 p A.metaclass.instance_methods.grep /class_var$|instance_var$/  # => ["instance_var", "class_var"]
 p A.singleton_methods.grep /class_var$|instance_var$/           # => ["instance_var", "class_var"]
 p A.instance_methods.grep /class_var$|instance_var$/            # => []
  
  a = A.new
  #~ a.instance_methods                       # => Exceptions instance_methods undefined.
 p A.instance_methods.grep /foo/            # => ["foo"]
 p a.metaclass.instance_methods.grep /foo/  # => ["foo"]  # instance_methods is also kept in metaclass
 p a.singleton_methods                      # => []

  # singleton_methods() is away to keep track of instance method added to the metaclass  
  def a.bar; 'bar'; end
p  a.singleton_methods                      # => ['bar'], exists in singleton_methods
p  a.metaclass.instance_methods.grep /bar/  # => ['bar'], as well as metaclass' instance_methods

file = <<'HERE'
Note:

singleton_methods is can be used to keep track of methods added to the metaclass of an object.
metaclass.instance_methods reads all available methods: including instance methods defined in class definitions.
klass.metaclass.instance_methods == klass.public_methods (see below)
HERE

puts file