class Rental
  attr_accessor :date, :book, :person
  # belongs to relationship
  # attr_reader :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end
end
