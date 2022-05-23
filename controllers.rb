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

class Controllers
  attr_reader :people, :books

  def initialize
    @people = []
    @books = []
  end

  def list_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def list_books
    @books.each { |book| puts "Title: \"#{book.title}\" , Author: #{book.author}" }
  end

  def create_teacher(new_person)
    @people << new_person
  end

  def create_student(new_person)
    @people << new_person
  end

  def create_book(new_book)
    @books << new_book
  end

  def create_rental(date, book, person)
    Rental.new(date, book, person)
  end

  def list_persons_rentals
    person = @people.select { @id = id }
    person[0].rentals.each do |rental|
    puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
