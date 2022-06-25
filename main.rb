require_relative 'person'
require_relative 'student'
require_relative 'classroom'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'book'
require_relative 'rental'

# Run the following code
class Main
  person = Person.new(22, 'maximilianus')
  p person.correct_name
  capitalized_person = CapitalizeDecorator.new(person)
  p capitalized_person.correct_name
  capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
  p capitalized_trimmed_person.correct_name

# UML Diagram & Relationships Student-Classroom ex.
  said_rasinlic = Student.new(22, 'Said Rasinlic')
  classroom_A = Classroom.new('classroom_A')

  classroom_A.add_student(said_rasinlic)

  p said_rasinlic.classroom.label
  p classroom_A.students.map { |student| student.name }

  # Book Rentals
  harry_potter = Book.new('Harry Potter', 'J.K. Rowling')
  pinocchio = Book.new('Pinocchio', 'Carlo Collodi')
  anna_karenina = Book.new('Anna Karenina', 'Leo Tolstoy')
  unique_path = Book.new('Unique Path', 'Said Rasinlic')
  
  rental_one = Rental.new('06-24-2022', anna_karenina, said_rasinlic)
  rental_two = Rental.new('01-14-2000', unique_path, said_rasinlic)

  p said_rasinlic.rentals.map { |rent| [rent.date, rent.book.title] }
  p said_rasinlic.rentals.first.book.author
  # p anna_karenina.rentals.map { |rent| rent.date } 
  # p said_rasinlic.rentals
end
