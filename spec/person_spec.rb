require './person'

describe '#Person' do
  context 'when testing the Person class' do
    age = 22
    name = 'Said R.'
    person = Person.new(age, name)

    it 'should validate the age property' do
      expect(person.age).to eq age
    end

    it 'should validate the name property' do
      expect(person.name).to eq name
    end

    it 'should return true when calling can_use_services method' do
      expect(person.can_use_services?).to eq true
    end

    it 'should return false when calling can_use_services method for person with age under 18' do
      person2 = Person.new(17, 'Johnny Depp', parent_permission: false)
      expect(person2.parent_permission).to be false
    end

    it 'should return true if object is instance of the Person class ' do
      person2 = Person.new(17, name, parent_permission: false)
      expect(person2).to be_an_instance_of Person
    end
  end
end
