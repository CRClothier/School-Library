require './person'
require './classroom'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'unknown', parent_permission: true, id: nil)
    super(age, name, id: id)
    @parent_permission = parent_permission
    @classroom = classroom
    classroom.students << self if @classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless owner.animals.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_json(*_params)
    { json_class: self.class.name, age: @age, classroom: @classroom, name: @name, parent_permission: @parent_permission,
      id: @id }.to_json
  end

  def self.json_create(hash)
    new(hash['age'], hash['classroom'], hash['name'], parent_permission: hash['parent_permission'], id: hash['id'])
  end
end
