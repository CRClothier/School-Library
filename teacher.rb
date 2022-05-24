require './person'

class Teacher < Person
  def initialize(age, specialization, name = 'unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*params)
    {json_class: self.class.name, age: @age, specialization: @specialization, name: @name, id: @id}.to_json
  end
end
