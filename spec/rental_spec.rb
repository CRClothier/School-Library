require './rental'
require './person'
require './book'

describe Rental do
  context 'Given a person, book and date' do
    it 'Should create a rental' do
      book = Book.new('Logicomix: an epic serch for truth', 'Apotolos doxiadis')
      person = Person.new(32)
      date = '2022/01/01'

      rental = Rental.new(date, book, person)

      expect(rental).to be_truthy
    end
    it 'Should create a rental with date equal to given date' do
      book = Book.new('Logicomix: an epic serch for truth', 'Apotolos doxiadis')
      person = Person.new(32)
      date = '2022/01/01'

      rental = Rental.new(date, book, person)

      expect(rental.date).to eq date
    end
    it 'Should create a rental add it self to the person rentals' do
      book = Book.new('Logicomix: an epic serch for truth', 'Apotolos doxiadis')
      person = Person.new(32)
      date = '2022/01/01'

      rental = Rental.new(date, book, person)

      expect(person.rentals[0]).to be rental
    end
    it 'Should create a rental add it self to the book rentals ' do
      book = Book.new('Logicomix: an epic serch for truth', 'Apotolos doxiadis')
      person = Person.new(32)
      date = '2022/01/01'

      rental = Rental.new(date, book, person)

      expect(book.rentals[0]).to be rental
    end
  end
end