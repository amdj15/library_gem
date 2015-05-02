module Library
	module Books
		class Book
			attr_accessor :title, :ordersCnt
			attr_reader :author

			def initialize(title, author)
				@title, @author = title, author
				@ordersCnt = 0
			end
		end

		class Author
			attr_accessor :name, :biography
			attr_reader :books

			def initialize(name, biography)
				@name, @biography = name, biography
				@books = Hash.new
			end

			def createBook(title)
				@books[title] = Book.new(title, self)
			end
		end
	end
end