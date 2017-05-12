class Library
	def initialize
		@books = []
		@users = []
	end

	def add_book(book)
		@books << book
	end

	def add_user(user)
		@users << user
	end

	def checkout_book(book, user)
		if user.can_rent_books? and book.status == "Available"
			book.status = "Checked Out"
			book.renter = user.name
			book.due_date = (Time.now + 604800).to_i
			user.add_book(book)
		else
			puts "Cannot checkout #{book.title}"
			# elsif book.due_date > (Time.now).to_i
			# 	puts "The book you selected is already checked out."
			# elsif user.book_checked_out.lenth > 2
			# 	puts "You cannot check out more than two books."
			# elsif book.status == 'Lost'
			# 	puts "The book you selected is lost."
		end
	end

# Change  book status to "lost" if assigned lost status.
	def is_lost
		book.status = 'Lost'
	end

	

# Change book status to "overdue" if reader keeps book past due_date
	def is_overdue
		if (Time.now).to_i > book.due_date && book.status == "Checked Out"
			book.status = "Overdue"
			puts "#{book.title} is overdue!"
		elsif book.status == "Avalable"
			puts "#{book.title} is available."
		else
			puts "#{book.title} is checked out but not overdue."
		end
	end


	def return_book(book, user)
		user.books_checked_out.delete(book)
		book.status = "Available"
		book.due_date = nil
		book.renter = nil
	end

	def list_checked_out
		@books.each do |book|
			if book.status == "Checked Out"
				puts "#{book.title}"
			end
		end
	end

	def list_overdue
		@books.each do |book|
			if book.status == "Overdue"
				puts "#{book.title}"
			end
		end
	end
end


