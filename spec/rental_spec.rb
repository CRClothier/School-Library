require './rental'
require './person'
require './book'

describe Rental do
  context 'Given a person, book and date' do
    it 'Should create a rental' do
      date = '2022/05/25'
      book = Book.new('Harry Potter', 'J K Rowling')
      person = Person.new(35)

      rental = Rental.new(date, book, person)

      expect(rental).to be_truthy
    end

    it 'Should create a rental with the correct date' do
      date = '2022/05/25'
      book = Book.new('Harry Potter', 'J K Rowling')
      person = Person.new(35)

      rental = Rental.new(date, book, person)

      expect(rental.date).to eq date
    end

    it 'Should create a rental and add itself to the person\'s rentals' do
      date = '2022/05/25'
      book = Book.new('Harry Potter', 'J K Rowling')
      person = Person.new(35)

      rental = Rental.new(date, book, person)

      expect(person.rentals[0]).to be rental
    end

    it 'Should create a rental and add itself to the book\'s rentals' do
      date = '2022/05/25'
      book = Book.new('Harry Potter', 'J K Rowling')
      person = Person.new(35)

      rental = Rental.new(date, book, person)

      expect(book.rentals[0]).to be rental
    end
  end
end
