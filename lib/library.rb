require "library/version"
require "library/books"
require "library/orders"

module Library
	class Library
		include Books, Orders

		attr_reader :orders, :authors, :readers

		def initialize filepath = ''
			@authors = Hash.new
			@readers = Hash.new
			@orders = Hash.new
		end

		def add_book (title, author, biography = '')
			@authors[author] = Author.new(author, biography) unless @authors[author]
			@authors[author].createBook(title) unless @authors[author].books[title]
		end

		def add_reader(*args)
			@readers[args[1]] = Reader.new(*args)
		end

		def add_order(reader, bookName, authorName)
			@orders[reader.email] = [] unless @orders[reader.email]

			if (@orders[reader.email].index(@authors[authorName].books[bookName]) == nil)
				@authors[authorName].books[bookName].ordersCnt += 1
				@orders[reader.email] << @authors[authorName].books[bookName]
			else
				"User already got this book"
			end
		end

		def who_often_takes_the_book
			oftenReaderMail, len = @orders.keys[0], @orders.values[0].length

			@orders.each do |email,  orders|
				oftenReaderMail = email if orders.length > len
			end

			return @readers[oftenReaderMail]
		end

		def most_popular_book
			popularBook = @authors.values[0].books.values[0]

			@authors.each do |key, author|
				author.books.each do |title, book|
					popularBook = book if book.ordersCnt > popularBook.ordersCnt
				end
			end

			return popularBook
		end

		def how_many_people_ordered_one_of_the_three_most_popular_books
			all_books = []

			@authors.each do |k, author|
				author.books.each do |d, book|
					all_books << book
				end
			end

			all_books.sort_by(&:ordersCnt).reverse!.slice(0..2)
		end

		def save
			File.open("data", "w") { |file| Marshal.dump(self, file)  }
		end

		class << self
			def load filepath
				Marshal.load(File.open(filepath))
			end
		end
	end
end
