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

  def to_json(*_params)
    { json_class: self.class.name, title: @title, author: @author }.to_json
  end

  def self.json_create(hash)
    new(hash['title'], hash['author'])
  end
end
