require './person'

class Teacher < Person
  def initialize(age, specialization, name = 'unknown', id: nil)
    super(age, name, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*_params)
    { json_class: self.class.name, age: @age, specialization: @specialization, name: @name, id: @id }.to_json
  end

  def self.json_create(hash)
    new(hash['age'], hash['specialization'], hash['name'], id: hash['id'])
  end
end
