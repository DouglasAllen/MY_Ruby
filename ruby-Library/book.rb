class Book
	attr_accessor :title, :author, :description, :renter, :due_date, :status
		def initialize(title, author, description)
    @title = title
		@author = author 
		@description = description
		@renter = nil
		@due_date = nil
		@status = 'Available'
	end
end