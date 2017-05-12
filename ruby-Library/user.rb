class User
	attr_accessor :books_checked_out, :name
	def initialize(name)
		@name = name	
		@books_checked_out = Array.new
	end

  def add_book(book)
    @books_checked_out << book
  end

  def can_rent_books?
    @books_checked_out.each do |b|
      if b.status == "Overdue"
        return false
      end
    end

    @books_checked_out.count < 2
  end
end 