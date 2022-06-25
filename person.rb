require_relative 'nameable'

class Person < Nameable
  attr_accessor :age, :name, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # has many relationship
  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def of_age?
    @age >= 18
  end

  private :of_age?
end
