# br_ch02_classes.rb

class Person
      attr_accessor :name, :age, :gender
end

person_instance = Person.new
person_instance.name = "Robert"
person_instance.age = 52
person_instance.gender = "male"
puts person_instance.name

class Pet
      attr_accessor :name, :age, :gender, :color, :length
end

class Cat < Pet
      def speak
      "Meow!"
      end
end

class Dog < Pet
      def speak
      "Woof!"
      end
end

class Snake < Pet  
end

snake = Snake.new
snake.name = "Sammy"
snake.length = 500
lassie = Dog.new
lassie.name = "Lassie"
lassie.age = 20
lassie.length = 10
lassie = Dog.new
puts lassie.speak
your_cat = Cat.new
puts your_cat.speak




