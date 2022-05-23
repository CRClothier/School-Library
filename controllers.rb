require './book'
require './rental'
require './student'
require './teacher'

class Controllers
  attr_reader :people, :books

  def initialize
    @people = []
    @books = []
  end

  def list_people
    @people.each { |person| yield person }
  end

  def list_books
    @books.each { |book| yield book }
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

  def list_persons_rentals(id)
    person = @people.select { @id = id }
    person[0].rentals.each { |rental| yield rental }
  end
end
