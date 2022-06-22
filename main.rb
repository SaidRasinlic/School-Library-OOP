require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

# Try the following code

class Main
  person = Person.new(22, 'maximilianus')
  p person.correct_name
  capitalized_person = CapitalizeDecorator.new(person)
  p capitalized_person.correct_name
  capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
  p capitalized_trimmed_person.correct_name
end
