require './person'
require './book'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def to_json(*_params)
    { json_class: self.class.name, person_id: @person.id, book_title: @book.title, book_author: @book.author,
      date: @date }.to_json
  end
end
