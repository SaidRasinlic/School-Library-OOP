require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'book'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # Show menu for users
  def show_menu
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts "7 - Exit\n\n"
    gets.chomp
  end

  # Method that handles user choice
  def run
    user_choice = show_menu
    case user_choice
    when '1'
      action_list_books
    when '2'
      action_list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rental
    else
      puts 'Thanks for using this app ...'
      exit
    end
  end

  # List all books
  def list_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  # Action list all Books
  def action_list_books
    list_books
    puts 'Press enter to continue ...'
    gets.chomp
    run
  end

  # Permission access for Person (Teacher or Student)
  def permission(my_char)
    case my_char
    when 'N' || 'n'
      false
    when 'Y' || 'y'
      true
    end
  end

  # List all People
  def list_people
    @people.each_with_index do |person, index|
      # puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  # List all Books
  def action_list_people
    list_people
    puts "\n\nPress any key to continue"
    gets
    run
  end

  # List all rentals for a given person id.
  def list_rentals(id)
    selected_person = @people.find { |person| person.id == id }
    return nil if selected_person.nil?

    selected_person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end

  # Handles creation of a Person (Teacher or Student)
  def create_person
    print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]: '
    person_type = gets.chomp
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    end
    puts "\n*Person created successfully*\n\n"
    # gets
    run
  end

  # Create a Student
  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    student = Student.new(age, name, permission(permission))
    @people.push(student)
  end

  # Create a Teacher
  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
  end

  # Create a book
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts "\n*Book created successfully*\n\n"
    run
  end

  # Create a rental
  def create_rental
    puts "\nSelect a book from the following list by number"
    list_books
    book_index = gets.chomp
    puts "\nSelect a person from the following list by number"
    list_people
    person_index = gets.chomp
    print "\n Date(yyyy/mm/dd): "
    rental_date = gets.chomp
    new_rental = Rental.new(rental_date, @books[book_index.to_i], @people[person_index.to_i])
    @rentals.push(new_rental)
    puts 'Rental added successfully'
    run
  end
end
