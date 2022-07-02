require './capitalize_decorator'

describe CapitalizeDecorator do
  context 'When testing the Basedecorator class' do
    it 'should return \'said\' when we call the correct_name method' do
      person = Person.new(22, 'said')
      capitalize_decorator = CapitalizeDecorator.new(person)
      name = capitalize_decorator.correct_name
      expect(name).to eq 'Said'
    end
  end
end
