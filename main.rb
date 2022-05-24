require './app'
require './controllers'

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

# rubocop:disable Metrics/CyclomaticComplexity
def main
  controller = Controllers.new
  controller.load_data
  app = App.new(controller)
  loop do
    options
    case gets.chomp
    when '1' then app.list_books
    when '2' then app.list_people
    when '3' then app.create_person
    when '4' then app.create_book
    when '5' then app.create_rental
    when '6' then app.list_persons_rentals
    when '7'
      controller.save_data
      exit
    else
      puts 'Invalid input, please try again...'
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

main
