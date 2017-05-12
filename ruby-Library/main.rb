require 'user' 
require 'book'
require'library'

library = Library.new
gamble = User.new('Gamble')


book_a = Book.new('Harry Potter', 'J.K. Rowling', 'Childrens fantasy fiction')
book_b = Book.new('Thinking, Fast and Slow', 'Daniel Kahneman', 'Phycology and behavioral economics non-fiction')
book_c = Book.new('Foundation', 'Isaac Asimov', 'Classic sci-fi fiction')


library.add_book(book_a) 
library.add_book(book_b) 
library.add_book(book_c)


book_a.status = "Lost"
book_b.status = "Available" 
book_c.status = "Overdue"

library.list_overdue


library.checkout_book(book_b, gamble)
gamble.add_book(book_c)
library.list_checked_out