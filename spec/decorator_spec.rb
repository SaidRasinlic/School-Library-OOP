require './decorator'

describe Decorator do
  context 'When testing the Basedecorator class' do
    it 'should return \'said\' when we call the correct_name method' do
      person = Person.new(22, 'said')
      base_decorator = Decorator.new(person)
      name = base_decorator.correct_name
      expect(name).to eq 'said'
    end
  end
end
