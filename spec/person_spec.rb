require './person'

describe Person do
  context 'given an age' do
    it 'should create a person' do
      age = 23

      result = Person.new(age)

      expect(result).to be_truthy
    end
  end

  context 'given a person' do
    it 'should allow reading an writing the attribute name' do
      person = Person.new(41)

      person.name = 'other'

      expect(person.name).to eq('other')
    end

    it 'should allow reading an writing the attribute age' do
      person = Person.new(41)

      person.age = 23

      expect(person.age).to eq(23)
    end

    it 'should allow reading the attribute id' do
      person = Person.new(41, id: 51)

      expect(person.id).to eq(51)
    end

    it 'should allow reading the attribute rentals' do
      person = Person.new(41)

      expect(person.rentals).to eq([])
    end
  end

  context 'getter method correct_name' do
    it 'should return the value of attribute name' do
      person = Person.new(41, 'Jose')

      result = person.correct_name

      expect(result).to eq('Jose')
    end
  end

  context 'method can_use_services?' do
    it 'should return true if age over 18' do
      person = Person.new(41, parent_permission: false)

      result1 = person.can_use_services?
      person.age = 18
      result2 = person.can_use_services?
      person.age = 17
      result3 = person.can_use_services?

      expect(result1).to be(true)
      expect(result2).to be(true)
      expect(result3).to be(false)
    end

    it 'should return true if has parent permision' do
      person = Person.new(12, parent_permission: true)

      result = person.can_use_services?

      expect(result).to be(true)
    end
  end

  context 'method add_rental' do
    let(:book) { double('Book').as_null_object }
    it 'should retun a rental given a date and book' do
      person = Person.new(12)
      date = '2022/01/01'
      allow(book).to receive(:rentals).and_return([])

      result = person.add_rental(date, book)

      expect(result.class).to be(Rental)
    end
  end
end
