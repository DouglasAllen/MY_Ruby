# begruby2_ch04_useful_words.rb

text = %q{Los Angeles has some of the nicest weather in the country.}
p text
puts text.inspect
stopwords = %w{the a by on for of are with just but and to the my in I has some}
p stopwords
puts stopwords.inspect
words = text.scan(/\w+/)
p words
puts words.inspect
keywords = words.select { |word| !stopwords.include?(word) }
p keywords
puts keywords.inspect
selected_words = keywords.join(' ')
p selected_words
puts selected_words.inspect


