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
    File.open('./data/people.json', 'w') { |f| f.write JSON.dump(@people) }
    File.open('./data/books.json', 'w') { |f| f.write JSON.dump(@books) }
  end
end
