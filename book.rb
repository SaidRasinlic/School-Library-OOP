class Book
  attr_accessor :title, :author, :rentals

  # belongs to relationship
  # attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # has many + both ways relationship
  def add_rental(rental)
    @rentals << rental
    rental.book = self
  end
end
