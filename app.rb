require './book'
require './capitalize_decorator'
require './classroom'
require './decorator'
require './nameable'
require './person'
require './rental'
require './student'
require './teacher'
require './trimmer_decorator'

class App
  def initialize
    @people = []
    @books = []
  end

  def list_people
    ...
  end

  def list_books
    ...
  end

  def create_person
    ...
  end

  def create_book
    ...
  end

  def create_rental
    ...
  end

  def list_persons_rentals
    ...
  end
end