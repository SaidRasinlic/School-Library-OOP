require './classroom'

describe '#Classroom' do
  context 'when testing the Classroom class' do
    it 'should validate the label property' do
      classroom_label = 'Ultimate Nerds'
      classroom = Classroom.new('Ultimate Nerds')

      expect(classroom.label).to eq classroom_label
    end
  end
end
