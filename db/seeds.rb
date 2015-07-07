# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [
  { title: "Puppies", directed_by: "Dog", votes: 10, description: "" },
  { title: "Kitties", directed_by: "Cat", votes: 9, description: "" },
  { title: "Fishies", directed_by: "Fish", votes: 0, description: "" },
  { title: "Llamas", directed_by: "The Llama", votes: 6, description: "" },
  { title: "Orangutans", directed_by: "Orangutan", votes: 7, description: "" },
  { title: "Elephants", directed_by: "Elephant", votes: 0, description: "" }
]

movies.each do |movie|
  Movie.create(movie)
end

books = [
  { title: "Puppies", written_by: "Dog", votes: 10, description: "" },
  { title: "Kitties", written_by: "Cat", votes: 9, description: "" },
  { title: "Fishies", written_by: "Fish", votes: 0, description: "" },
  { title: "Llamas", written_by: "The Llama", votes: 6, description: "" },
  { title: "Orangutans", written_by: "Orangutan", votes: 7, description: "" },
  { title: "Elephants", written_by: "Elephant", votes: 0, description: "" }
]

books.each do |book|
  Book.create(book)
end

albums = [
  { title: "Puppies", recorded_by: "Dog", votes: 10, description: "" },
  { title: "Kitties", recorded_by: "Cat", votes: 9, description: "" },
  { title: "Fishies", recorded_by: "Fish", votes: 0, description: "" },
  { title: "Llamas", recorded_by: "The Llama", votes: 6, description: "" },
  { title: "Orangutans", recorded_by: "Orangutan", votes: 7, description: "" },
  { title: "Elephants", recorded_by: "Elephant", votes: 0, description: "" }
]

albums.each do |album|
  Album.create(album)
end
