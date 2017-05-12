file = <<'EOS'

Ruby is a language with a set of powerful features – the most powerful arguably being Blocks, Procs, and Lambdas.
In short, these features allow you to pass code to a method and execute that code at a later time. 
Despite regularly using these features, many developers don’t fully understand the subtle differences between them.

Study Guides: 
  When applying for a programming job, you’ll often be presented with a quiz that intends to determine your 
  level of knowledge and experience in a given subject. 
  The various articles in this series provide condensed solutions to the questions that you might expect 
  to see on such tests.

Blocks:
  A block is code that is implicitly passed to a method through the use of either curly braces, {...}, 
  or do...end syntax. It’s common convention to use {...} for single line blocks, and do...end for multi-line blocks. 
  For example, the following blocks are functionally the same:

  array = [1,2,3,4]
  array.map! do |n|
    n * n
  end
  => [1, 4, 9, 16]
  array = [1,2,3,4]
  array.map! { |n| n * n }
  => [1, 4, 9, 16]
  
  The magic behind a block is the yield keyword; it defers the execution of the calling method in order to 
  evaluate the block. The result of the block, if any, is then evaluated by any remaining code in the method. 
  The yield statement can also accept parameters, which are then passed into and evaluated within the block. 
  Tying this together, a simple example of the map! above method would be the following:

  class Array
    def map!
      self.each_with_index do |value, index|
        self[index] = yield(value)
      end
    end
  end

  This simple representation of map! calls the each_with_index method and replaces the item at the given 
  index with the result of the block. While this is a trivial example of block usage, it helps to show yield‘s 
  power. The uses of blocks in Ruby are endless, and we frequently use them in our code.

Procs:
  The above example demonstrates a minor limitation of blocks: they are syntax and disposable. 
  We have to retype blocks every time we reuse them on different arrays, but we can store a block for later 
  use by using the Ruby Proc Object. We can store a Proc in a variable, and then explicitly pass it to any 
  method that accepts a callable object. Rewriting the above example as a Proc would look like the following:

  number_squared = Proc.new { |n| n * n }

  Let’s modify our map! method to accept and call the Proc object:

  class Array
    def map!(proc_object)
      self.each_with_index do |value, index|
        self[index] = proc_object.call(value)
      end
    end
  end
  array = [1,2,3,4]
  array.map!(number_squared)
  => [1, 4, 9, 16]

  Take note that we no longer use the yield keyword; instead, we directly use the call method on the 
  Proc object, passing it the value from the array. We receive the same result as before, but we store our 
  block in a variable to reuse a later time.

Lambdas:
  Lambda function are almost identical to Procs but with two key differences. 
  First, a lambda checks the the number of arguments it receives and returns an ArgumentError if they do not 
  match. For example:

  l = lambda { "I'm a lambda" }
  l.call
  => "I'm a lambda"
  l.call('arg')

  ArgumentError: wrong number of arguments (1 for 0)

  Second, lambdas provide diminutive returns – meaning that when a Proc encounters a return statement in 
  it’s execution, it halts the method and returns the provided value. Lambdas on the other hand, return their 
  value to the method, allowing it to continue:

  def proc_math
    Proc.new { return 1 + 1 }.call
    return 2 + 2
  end
  def lambda_math
    lambda { return 1 + 1 }.call
    return 2 + 2
  end
  proc_math # => 2
  lambda_math # => 4

  As you can see proc_math hits the return statement inside the Proc and returns the value of 2. 
  In contrast, lambda_math skips the return statement and evaluates 2 + 2 instead.
  One final note: Ruby 1.9 introduces the new “stabby” lambda syntax (represented with ->), which is 
  functionally identical to the traditional lambda syntax, but the “stabby” syntax is much cleaner.

Conclusion:
  In this study guide, we’ve covered the key differences between Blocks, Procs, and Lambdas:
  Blocks are single use.
  Procs exist as objects.
  Lambdas have strict argument checking.

  For a more in-depth review, I recommend the following resources:
  http://net.tutsplus.com/tag/ruby-study-guide/
  http://www.ruby-doc.org/core-1.9.3/Proc.html
  http://pragprog.com/book/ruby3/programming-ruby-1-9
  http://pragprog.com/book/ppmetr/metaprogramming-ruby
  http://net.tutsplus.com/tutorials/ruby/ruby-on-rails-study-guide-blocks-procs-and-lambdas/
EOS
puts file