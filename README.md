# Library

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/library`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'library'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install library

## Usage

```ruby
    require 'bundler/setup'
    require "library"

    library = Library::Library.new

    library.add_book("fst book", "JL")
    library.add_book("scn book", "JL")

    library.add_book("trd book", "JL2")
    library.add_book("super book", "JL2")
    library.add_book("super book  2", "JL2")
    library.add_book("super book 3", "JL2")

    # create readers
    reader = library.add_reader("amdj15", "amdj15@gmail.com", "Dp")
    reader_2 = library.add_reader("reader_2", "reader@tst.com", "Dp")
    reader_3 = library.add_reader("reader_3", "reader_3@tst.com", "Dp")

    # create orders
    library.add_order(reader, "fst book", "JL")
    library.add_order(reader, "scn book", "JL")
    library.add_order(reader, "trd book", "JL2")

    library.add_order(reader_2, "scn book", "JL")
    library.add_order(reader_2, "trd book", "JL2")
    library.add_order(reader_3, "scn book", "JL")

    library.save

    # library = Library::Library.load "data"

    puts library.who_often_takes_the_book.name
    puts library.most_popular_book
    library.how_many_people_ordered_one_of_the_three_most_popular_books.each     {|book| puts "#{book.title} : #{book.ordersCnt}"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/library/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
