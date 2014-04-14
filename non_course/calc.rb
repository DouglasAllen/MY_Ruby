puts 1+2
puts 2*3
puts 5-8
puts 9/2
puts 1.0 + 2.0
puts 2.0 * 3.0
puts 5.0 - 8.0
puts 9.0 / 2.0

#how many hours are in a year? 
day = 24
year = 365.25
hours = day * year
puts hours

#how many minutes are in a decade? 
deca = 10
min = 60
hours = min * day * year * deca
puts hours

#how many seconds old are you?
age = 54
sec = 60
hmso = sec * min * day * year * age
puts hmso

#how many chocolates do you hope to eat in your life? 
puts "Warning: This part of the program could take a while to compute!"

#If I am 1022 million seconds old, how old am I?
hmso = 1022000000
age = hmso / sec / min / day / year
puts age