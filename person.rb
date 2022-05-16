class Person
  def initialize(name = "unknown", parent_permission = true, age)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name
  attr_accessor :age

  def is_of_age?
    @age >= 18
  end

  def can_use_services?
    is_of_age? || @parent_permission == true
  end
end
