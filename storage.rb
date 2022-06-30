require 'json'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

def initialize_files
  File.write('./data/book_file.json', []) unless File.exist?('./data/book_file.json')
  File.write('./data/people_file.json', []) unless File.exist?('./data/people_file.json')
  File.write('./data/rental_file.json', []) unless File.exist?('./data/rental_file.json')
end

# Read books from JSON file
def read_books
  books = []
  JSON.parse(File.read('./data/book_file.json')).each do |book|
    books.push(Book.new(book['title'], book['author']))
  end
  books
end

# Write books into JSON file

def write_books(books)
  temp = []
  books.each do |book|
    temp.push({
                title: book.title,
                author: book.author
              })
  end

  File.write('./data/book_file.json', JSON.generate(temp).to_s)
end

def write_people(persons)
  temp = []
  persons.each do |person|
    temp << if person.instance_of? Student
              {
                role: 'Student',
                name: person.name,
                age: person.age,
                parent_permission: person.parent_permission
              }
            elsif person.instance_of? Teacher
              {
                role: 'Teacher',
                name: person.name,
                age: person.age,
                specialization: person.specialization
              }
            end
  end

  File.write('./data/people_file.json', JSON.generate(temp)).to_s
end

def read_people
  people = []
  JSON.parse(File.read('./data/people_file.json')).each do |person|
    people << case person['role']
              when 'Student'
                Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
              when 'Teacher'
                Teacher.new(person['age'], person['specialization'], person['name'])
              end
  end
  people
end
