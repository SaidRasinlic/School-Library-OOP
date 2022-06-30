require 'json'
require_relative 'app'
require_relative 'storage'

def main
  app = App.new
  puts "Welcome to School Library App!\n\n"
  app.run
end

initialize_files
main
