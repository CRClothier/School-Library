class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = title
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def book=(book)
    @book = book
    book.rentals << self unless book.rentals.include?(self)
  end

  def person=(person)
    @person = person
    person.rentals << self unless person.rentals.include?(self)
  end
end
