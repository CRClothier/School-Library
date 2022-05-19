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
  attr_reader :people, :books

  def initialize
    @people = []
    @books = []
  end

  def list_people
    if @people.empty?
      puts
      puts 'No people in system.'
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def list_books
    if @books.empty?
      puts
      puts 'No books in system.'
    else
      @books.each { |book| puts "Title: \"#{book.title}\" , Author: #{book.author}" }
    end
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    new_person = Teacher.new(age, specialization, name)
    @people << new_person
    puts 'Person created successfully'
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    permission = permission.upcase == 'Y'
    new_person = Student.new(age, nil, name, parent_permission: permission)
    @people << new_person
    puts 'Person created successfully'
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid entry. Please try again...'
      create_person
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books << new_book
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    @books.each_with_index { |book, i| puts "#{i + 1}) Title: \"#{book.title}\" , Author: #{book.author}" }
    book_index = gets.chomp.to_i - 1
    puts 'Select a person from the following list by number (not id):'
    @people.each_with_index do |person, i|
      puts "#{i + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i - 1
    print 'Date: '
    date = gets.chomp
    Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_persons_rentals
    print 'ID of person: '
    id = gets.chomp
    puts 'Rentals:'
    person = @people.select { @id = id }
    person[0].rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
