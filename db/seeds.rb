# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
movies = [
  { name: "Mad Max", director: "George Miller", description: "Smash the patriarchy", rank: 0 },
  { name: "Jurassic World", director: "Who cares", description: "Dinosaurs", rank: 0 }
]

movies.each do |movie|
  Movie.create movie
end

books = [
  { name: "1Q84", author: "Murakami", description: "cats", rank: 0 },
  { name: "Brief Wondrous Life of Oscar Wao", author: "Junot Diez", description: "living in jersey", rank: 0 }
]

books.each do |book|
  Book.create book
end

albums = [
  { name: "Superstitious", artist: "Stevie Wonder", description: "fun times", rank: 0 },
  { name: "Daft Punk", artist: "Daft Punk", description: "dance dance dance", rank: 0 }
]

albums.each do |album|
  Album.create album
end
