module Library
	module Orders
		class Order
			attr_reader :book, :reader, :date

			def initialize(book, reader)
				@book, @reader = book, reader
				@date = DateTime.new
			end
		end

		class Reader
			attr_accessor  :name, :email, :city, :street, :house

			def initialize(name, email, city, street = '', house = '')
				@name, @email, @city, @street, @house =  name, email, city, street, house
			end
		end
	end
end