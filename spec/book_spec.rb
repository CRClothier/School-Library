require './book'

describe Book do
  context 'givrn a title and author' do
    it 'should create the book' do
      title = 'How does the mind work'
      author = 'Steven Pinker'

      result = Book.new(title, author)

      expect(result).to be_truthy
    end
  end

  context 'given a book' do
    it 'should allow reading an writing the property title' do
      book = Book.new('How does the mind work', 'Steven Pinker')

      book.title = 'other'

      expect(book.title).to eq('other')
    end

    it 'should allow reading an writing the property author' do
      book = Book.new('How does the mind work', 'Steven Pinker')

      book.author = 'other'

      expect(book.author).to eq('other')
    end

    it 'should allow reading the property rentals' do
      book = Book.new('How does the mind work', 'Steven Pinker')

      expect(book.rentals).to be_truthy
    end
  end

  context 'method add_rental' do
    let(:person) { double('Personr').as_null_object }
    it 'should create a rental given a date and person' do
      book = Book.new('How does the mind work', 'Steven Pinker')
      date = '2022/01/01'
      person_rentals = []
      allow(person).to receive(:rentals).and_return(person_rentals)

      result = book.add_rental(date, person)

      expect(result.class).to be(Rental)
    end

    it 'should add the new rental to book\'s rentals given a date and person' do
      book = Book.new('How does the mind work', 'Steven Pinker')
      date = '2022/01/01'
      person_rentals = []
      allow(person).to receive(:rentals).and_return(person_rentals)

      rental = book.add_rental(date, person)

      expect(book.rentals[0]).to be(rental)
    end

    it 'should given a date and person add the new rental to given person\'s rentals' do
      book = Book.new('How does the mind work', 'Steven Pinker')
      date = '2022/01/01'
      person_rentals = []
      allow(person).to receive(:rentals).and_return(person_rentals)

      rental = book.add_rental(date, person)

      expect(person.rentals[0]).to be(rental)
    end
  end

  context 'method to_json' do
    it 'should return a valid json representation excuding rentals' do
      book = Book.new('How does the mind work', 'Steven Pinker')

      result = book.to_json

      expect(result).to eq({ json_class: Book.name, title: 'How does the mind work',
                             author: 'Steven Pinker' }.to_json)
    end
  end

  context 'self method json_create' do
    it 'should given a hash containing title and author return an instance of Book whith it\s title and author' do
      hash = { 'json_class' => Book.name, 'title' => 'How does the mind work', 'author' => 'Steven Pinker' }

      result = Book.json_create(hash)

      expect(result.class).to be(Book)
      expect(result.title).to eq('How does the mind work')
      expect(result.author).to eq('Steven Pinker')
    end
  end
end
