# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
movies = [
  { name: "Mad Max", director: "George Miller", description: "Smash the patriarchy" },
  { name: "Jurassic World", director: "Who cares", description: "Dinosaurs" }
]

movies.each do |movie|
  Movie.create movie
end

books = [
  { name: "1Q84", author: "Murakami", description: "cats" },
  { name: "Brief Wondrous Life of Oscar Wao", author: "Junot Diez", description: "living in jersey" }
]

books.each do |book|
  Book.create book
end

albums = [
  { name: "A cool album", artist: "Stevie Wonder", description: "fun times" },
  { name: "Daft Punk", artist: "Daft Punk", description: "dance dance dance" }
]

albums.each do |album|
  Album.create album
end
