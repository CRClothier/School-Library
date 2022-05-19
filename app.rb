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
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"}
  end

  def list_books
    @books.each { |book| puts "Title: \"#{book.title}\" , Author: #{book.author}"}
  end

  def create_teacher
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    new_person = Teacher.new(age, specialization, name)
    @people << new_person
    puts 'Person created successfully'
  end

  def create_student
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [Y/N]:'
    permission = gets.chomp
    if permission.upcase == 'Y'
      permission = true
    else
      permission = false
    end
    new_person = Student.new(age, '', name, permission)
    @people << new_person
    puts 'Person created successfully'
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    option = gets.chomp
    if option == '1'
      create_student
    elsif option == '2'
      create_teacher
    else
      puts 'Invalid entry. Pleas try again...'
      create_person
    end 
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    new_book = Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    @books.each { |book, i| puts "#{i + 1}) Title: \"#{book.title}\" , Author: #{book.author}"}
    book_index = gets.chomp.to_i - 1
    puts 'Select a person from the following list by number (not id):'
    @people.each { |person, i| puts "#{i + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"}
    person_index = gets.chomp.to_i - 1
    puts 'Date:'
    date = gets.chomp.to_i - 1
    Rental.new(date, @books[book_index], @people[person_index])
    puts Rental created successfully
  end

  def list_persons_rentals
    puts 'ID of person:'
    id = gets.chomp
    puts " rentals"
    person = @people.select { |person| person.id = id }
    person[0].rentals.each { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"}
  end
end