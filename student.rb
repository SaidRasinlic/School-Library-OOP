require_relative 'person'

class Student < Person
  # belongs to relationship
  attr_reader :classroom

  def initialize(age, name = 'Unknown', classroom = nil, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  # both ways relationship
  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
