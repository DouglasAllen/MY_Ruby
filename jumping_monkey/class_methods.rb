file = <<'HERE'

Using self in Class Method

Be very careful when using private class method in public class method:
HERE

puts file

  class C
    def self.foo
      self.bar  # self.bar is same as C.bar which is illegal b/c we call private method on C
    end
  
    def self.baz
      bar
    end

    def self.bar
      'bar'
    end
    private_class_method :bar
  end

  C.foo # => NoMethodError: private method `poo' called for C:Class
  C.baz # => 'bar'