require 'json'
require_relative 'storage'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'book'

# require_relative 'storage'

class App
  def initialize
    @books = read_books
    @people = read_people
    @rentals = JSON.parse(File.read('./Data/rental_file.json'))
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
    # cd Documents/VSCodeProjects/School-Library-OOP
    choices = {
      '1' => -> { action_list_books },
      '2' => -> { action_list_people },
      '3' => -> { create_person },
      '4' => -> { create_book },
      '5' => -> { create_rental },
      '6' => -> { list_rental },
      '7' => -> { puts 'Thanks for using this app...' }
    }

    if choices.key?(user_choice)
      choices[user_choice].call
    else
      choices.default = run
    end
  end

  # List all books
  def list_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}\n\n"
    end
  end

  # Action list all Books
  def action_list_books
    list_books
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
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}
      , Parent Permission: #{person.parent_permission}\n\n"
    end
  end

  # List all Books
  def action_list_people
    list_people
    run
  end

  # List all rentals for specified user by id
  def list_rental
    puts 'No rentals has been made at the moment' if JSON.parse(File.read('./data/rental_file.json')).empty?
    print "\nID of person: "
    id = gets.chomp.to_i
    # selected_person = @people.find { |person| person.id == id.to_i }
    selected_person = JSON.parse(File.read('./Data/rental_file.json')).select { |person| person['id'] == id }

    if selected_person.nil?
      puts "No ID #{id} has been found"
      # run
    end
    # puts "This person has no rentals\n\n" if selected_person.rentals.length.zero?
    selected_person.each do |rental|
      puts "Lender: \"#{rental['lender']}\", Date: \"#{rental['date']}\", Book: \"#{rental['title']}\" by \"#{rental['author']}\"\n\n"
      # puts "Date: \"#{rental.date}\", Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
    run
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
    else puts 'Please select 1 or 2'
         create_person
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
    write_people(@people)
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
    write_people(@people)
  end

  # Create a book
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    write_books(@books)
    puts "\n*Book created successfully*\n\n"
    run
  end

  # Create a rental
  def create_rental
    puts "\nSelect a book from the following list by number"
    list_books
    book_index = gets.chomp.to_i
    puts "\nSelect a person from the following list by number"
    list_people
    person_index = gets.chomp.to_i
    print "\n Date(yyyy/mm/dd): "
    rental_date = gets.chomp
    new_rental = Rental.new(rental_date, @books[book_index], @people[person_index])

    temp = {
      id: new_rental.person.id,
      lender: new_rental.person.name,
      date: new_rental.date,
      title: @books[book_index].title,
      author: @books[book_index].author
    }

    @rentals << temp
    File.write('./Data/rental_file.json', JSON.generate(@rentals))
    puts 'Rental added successfully'
    run
  end
end
