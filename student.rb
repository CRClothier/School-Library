require './person'
require './classroom'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(age, name)
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

  def to_json(*params)
    {json_class: self.class.name, age: @age, classroom: @classroom, name: @name, parent_permission: @parent_permission, id: @id}.to_json
  end
end
