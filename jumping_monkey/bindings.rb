file = <<'HERE'

Bindings

Reference by Jim Weirich

In Ruby, bindings are explicitly made available in a Binding object. 
You can capture the current local variables Binding by calling Kernel#binding method.

Even though Ruby’s bindings are objects, there’s no easy way to get/set variables in a given binding. 
As a result, we must use the eval method in Kernel to access variables that bind to the binding object:


  eval "a", vars         # evaluate the value of variable "a" in binding "vars"
  eval "a=1337", vars # assign the value 1337 to variable "a" in binding "vars" 


Bindings and Local Scope

Local variables can be captured by calling binding. 
You can access any local variables by passing a reference of a binding context and calling eval on it:

HERE

puts file

  def foo( binding_context )
    a = "change a!"
    p eval "a", binding_context  # eval will only refer to binding the one that's in binding_context
  end

  def goo
    a = 1337
    foo( binding )
  end

  goo  # 1337

file = <<'HERE'

You can also hold on to a binding long after its scope has gone out:

HERE

puts file

  def bind_me
    a, b = 2, 3
    binding
  end

  bind_me_vars = bind_me
  ## bind_me() is now out of scope
  p eval "a", bind_me_vars          # => 2, "a" still exist in binding
  p eval "b", bind_me_vars          # => 3, so is b
  p eval "a=1337", bind_me_vars  # you can even give it a new value!  eval will return 1337
  p eval "a", bind_me_vars          # => 1337

file = <<'HERE'

Blocks and Bindings

A block The block automatically captures and carries with it the bindings from the code location where it was created 
(created => block is also an object):

HERE

puts file

  def var_a
    a = "var_a"
    lambda { a }
  end

  def redef_var_a(block)
    a = "something other than var_a"
    block.call          # a is still "var_a" in block's binding/context
  end

  p redef_var_a( var_a )  # => "var_a"

file = <<'HERE'

class_eval V.S. instance_eval

RDoc References:

Module#class_eval
Object#instance_eval
Both class_eval and instance_eval takes either a string or a block and will evaluate it in the appropriate context. For more, see below.
It is also a good idea to include __FILE__ and __LINE__ to quick spot errors when doing metaprogramming: eval Anti-pattern

HERE

puts file

  p eval("puts 'hello world'")
  # becomes
  p eval("puts 'hello world'", binding, __FILE__, __LINE__)

  p "str".instance_eval("puts self")
  # becomes
  p "str".instance_eval("puts self", __FILE__, __LINE__)

  p String.module_eval("A=1")
  # becomes
  p String.module_eval("B=1", __FILE__, __LINE__)

file = <<'HERE'

Module#class_eval

Module#class_eval is an alias for Module#module_eval
Since they are instance methods of Module and Module is mixed into Class, class_eval is specific to Class only:


  class A; end
  A.new.class_eval   # => NoMethodError: undefined method `class_eval' for #<A:0x6e1220>


Ruby internally uses self and ruby_class decide where it can define method when it encounters keyword like def, alias reference
When class_eval is used on a class object to define a method, it will set self = obj, ruby_class = obj. 
This means that the method you defined is effectively defined as a instance method for the given class.

HERE

puts file

  class A; end
  A.class_eval do
    def foo; puts 'foo'; end
  end
  # A.foo         # => NoMethodError
  A.new.foo   # => "foo"

file = <<'HERE'

Object#instance_eval

instance_eval is defined on Object, so it’s available on all objects, including class.
When instance_eval is used on a class object to define a method, it’ll set self = obj, ruby_class = metaclass. 
This means the method is a class method since it’s being defined on metaclass.

HERE

puts file

  class B; end
  B.instance_eval do
    def bar; puts 'bar'; end
  end
  B.bar         # => "foo"
  #B.new.foo   # => NoMethodError