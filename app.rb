class App
  def initialize(controller)
    @controller = controller
  end

  def list_people
    if @controller.people.empty?
      puts
      puts 'No people in system.'
    else
      @controller.list_people do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def list_books
    if @controller.books.empty?
      puts
      puts 'No books in system.'
    else
      @controller.list_books { |book| puts "Title: \"#{book.title}\" , Author: #{book.author}" }
    end
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @controller.create_teacher(age, specialization, name)
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
    @controller.create_student(age, name, permission)
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
    @controller.create_book(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    @controller.books.each_with_index { |book, i| puts "#{i + 1}) Title: \"#{book.title}\" , Author: #{book.author}" }
    book_index = gets.chomp.to_i - 1
    puts 'Select a person from the following list by number (not id):'
    @controller.people.each_with_index do |person, i|
      puts "#{i + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i - 1
    print 'Date: '
    date = gets.chomp
    @controller.create_rental(date, @controller.books[book_index], @controller.people[person_index])
    puts 'Rental created successfully'
  end

  def list_persons_rentals
    print 'ID of person: '
    id = gets.chomp
    puts 'Rentals:'
    @controller.list_persons_rentals(id) do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
