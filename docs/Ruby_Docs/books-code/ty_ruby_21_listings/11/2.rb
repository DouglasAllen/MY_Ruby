class Outer
  @@transient = 100
  PERMANENT = 200

  def say_something
    puts "Hello."
  end

  class Inner
    def greet
      puts "Hello from inside class Outer::Inner!"
    end
  end
end