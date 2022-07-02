require './book'
require './student'
require './rental'

describe Book do
  before :each do
    @book = Book.new 'Title', 'Author'
  end

  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      @book.should be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      @book.title.should eql 'Title'
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      @book.author.should eql 'Author'
    end
  end

  describe '#rentals' do
    it 'returns the empty rentals array' do
      expect(@book.rentals).to eql []
    end
  end

  describe '#add_rental method' do
    it 'should add a rental for specific person' do
      expect(@book.rentals.length).to eql(0)
      @student = Student.new(22, 'Said')
      @rental = Rental.new('2022-07-01', @book, @student)
      p(@book.rentals.map { |rent| [rent.date, rent.book.title] })
      expect(@book.rentals.length).to eql(1)
    end
  end
end
