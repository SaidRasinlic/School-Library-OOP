require './person'
require './teacher'

describe Teacher do
  before :all do
    @age = 60
    @specialization = 'Informatics'
    @name = 'Prof. Hoffman'
    @teacher = Teacher.new(@age, @specialization, @name)
  end

  context 'when testing the Teacher class' do
    it 'should return true if the Teacher class is kind of Person class' do
      expect(@teacher).to be_kind_of Person
    end

    it 'should validate the age property' do
      expect(@teacher.age).to eql 60
    end

    it 'should validate the specialization property' do
      expect(@teacher.specialization).to eql 'Informatics'
    end

    it 'should validate the name property' do
      expect(@teacher.name).to eql 'Prof. Hoffman'
    end

    it 'should always have permission to use services' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
