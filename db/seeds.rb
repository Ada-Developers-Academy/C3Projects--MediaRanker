# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [
  { title: "Puppies Movie", directed_by: "Dog", votes: 10, description: "" },
  { title: "Kitties Movie", directed_by: "Cat", votes: 9, description: "" },
  { title: "Fishies Movie", directed_by: "Fish", votes: 0, description: "" },
  { title: "Llamas Movie", directed_by: "The Llama", votes: 6, description: "" },
  { title: "Orangutans Movie", directed_by: "Orangutan", votes: 7, description: "" },
  { title: "Elephants Movie", directed_by: "Elephant", votes: 0, description: "" }
]

movies.each do |movie|
  Movie.create(movie)
end

books = [
  { title: "Puppies Book", written_by: "Dog", votes: 10, description: "" },
  { title: "Kitties Book", written_by: "Cat", votes: 9, description: "" },
  { title: "Fishies Book", written_by: "Fish", votes: 0, description: "" },
  { title: "Llamas Book", written_by: "The Llama", votes: 6, description: "" },
  { title: "Orangutans Book", written_by: "Orangutan", votes: 7, description: "" },
  { title: "Elephants Book", written_by: "Elephant", votes: 0, description: "" }
]

books.each do |book|
  Book.create(book)
end

albums = [
  { title: "Puppies Album", recorded_by: "Dog", votes: 10, description: "" },
  { title: "Kitties Album", recorded_by: "Cat", votes: 9, description: "" },
  { title: "Fishies Album", recorded_by: "Fish", votes: 0, description: "" },
  { title: "Llamas Album", recorded_by: "The Llama", votes: 6, description: "" },
  { title: "Orangutans Album", recorded_by: "Orangutan", votes: 7, description: "" },
  { title: "Elephants Album", recorded_by: "Elephant", votes: 0, description: "" }
]

albums.each do |album|
  Album.create(album)
end
