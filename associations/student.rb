require './person'
require './classroom'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    classroom.students << self
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless owner.animals.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
