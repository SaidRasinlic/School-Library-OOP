class Person
  
  attr_accessor :age, :name
  attr_reader :id

  def initialize(name = "Unknown", age, parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private def is_of_age?
    if @age >= 18 true
    else false
    end
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end
end
