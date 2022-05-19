require './app'

def options
  puts
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def main
  app = App.new
  options
  choice = gets.chomp
  case choice
  when '1'
    app.list_books
    main
  when '2'
    app.list_people
    main
  when '3'
    app.create_person
    main
  when '4'
    app.create_book
    main
  when '5'
    app.create_rental
    main
  when '6'
    app.list_persons_rentals
    main
  when '7'
    exit
  else
    puts 'Invalid option. Please try again...'
    main
  end
end

main()
