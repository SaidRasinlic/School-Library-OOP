require './person'
require './book'
require './rental'

describe 'Person' do
  before :all do
    @date = '2022-02-07'
    @person = Person.new(22, 'Said R.', parent_permission: true)
    @book = Book.new('Unique Path', 'Said Rasinlic')
  end

  describe '#rental' do
    context 'when initializing an instance of class Rental' do
      it 'should return true if there is 1 rental added' do
        Rental.new(@date, @book, @person)
        expect(@book.rentals.length).to be 1
      end

      it 'should return true if it is an instance of the Rental class' do
        rental = Rental.new(@date, @book, @person)
        expect(rental).to be_an_instance_of Rental
      end
    end
  end
end
