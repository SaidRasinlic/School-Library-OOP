require './trimmer_decorator'

describe TrimmerDecorator do
  context 'When testing the Basedecorator class' do
    it 'should return \'said\' when we call the correct_name method' do
      person = Person.new(22, 'SaidRasynl12345')
      trimmer_decorator = TrimmerDecorator.new(person)
      name = trimmer_decorator.correct_name
      expect(name).to eq 'SaidRasynl'
    end
  end
end
