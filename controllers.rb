require './book'
require './rental'
require './student'
require './teacher'
require 'json'

class Controllers
  attr_reader :people, :books

  def initialize
    @people = []
    @books = []
  end

  def list_people(&block)
    @people.each(&block)
  end

  def list_books(&block)
    @books.each(&block)
  end

  def create_teacher(age, specialization, name)
    new_person = Teacher.new(age, specialization, name)
    @people << new_person
  end

  def create_student(age, name, permission)
    new_person = Student.new(age, nil, name, parent_permission: permission)
    @people << new_person
  end

  def create_book(title, author)
    new_book = Book.new(title, author)
    @books << new_book
  end

  def create_rental(date, book, person)
    Rental.new(date, book, person)
  end

  def list_persons_rentals(id, &block)
    person = @people.select { @id = id }
    person[0].rentals.each(&block)
  end

  def save_data
    File.write('./data/people.json', JSON.dump(@people))
    File.write('./data/books.json', JSON.dump(@books))
    File.write('./data/rentals.json', JSON.dump((@books.map(&:rentals).flatten)))
  end

  # rubocop:disable Security/JSONLoad
  def load_data
    @people = JSON.load(File.read('./data/people.json'))
    @books = JSON.load(File.read('./data/books.json'))
    rentals = JSON.parse(File.read('./data/rentals.json'))
    rentals.each do |rental|
      this_book = @books.find { |book| (book.title == rental['book_title']) && (book.author == rental['book_author']) }
      this_person = @people.find { |person| person.id == rental['person_id'] }
      Rental.new(rental['date'], this_book, this_person)
    end
  end
  # rubocop:enable Security/JSONLoad
end
