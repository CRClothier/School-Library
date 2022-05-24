require './rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end

  def to_json(*params)
    {json_class: self.class.name, age: @age, specialization: @specialization, name: @name, id: @id}.to_json
  end
end
