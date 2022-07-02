require './person'
require './student'

describe Student do
  before :all do
    @age = 22
    @name = 'Said Rasinlic'
    @student = Student.new(@age, @name)
    @student_two = Student.new(17, 'John Smith', parent_permission: false)
  end

  describe '#student' do
    context 'when testing the Student class' do
      it 'should return true if the Student class is kind of Person class' do
        expect(@student).to be_kind_of Person
      end

      it 'should validate the age property' do
        expect(@student.age).to eql 22
      end

      it 'should validate the name property' do
        expect(@student.name).to eql 'Said Rasinlic'
      end

      it 'the student has permission to use services' do
        expect(@student.can_use_services?).to eq true
      end

      it 'the student does not have permission to use services' do
        expect(@student_two.can_use_services?).to eq false
      end
    end
  end
end
