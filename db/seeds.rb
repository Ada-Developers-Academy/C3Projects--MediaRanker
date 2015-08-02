# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [
  { name: "Movie 1", director: "Director 1", description: "Words, words, words.", rank: 0 },
  { name: "Movie 2", director: "Director 2", description: "Words, words, words.", rank: 0 },
  { name: "Movie 3", director: "Director 3", description: "Words, words, words.", rank: 0 },
  { name: "Movie 4", director: "Director 4", description: "Words, words, words.", rank: 0 }
]

movies.each do |movie|
  Movie.create movie
end



albums = [
  { name: "Album 1", artist: "Artist 1", description: "Words, words, words.", rank: 0 },
  { name: "Album 2", artist: "Artist 2", description: "Words, words, words.", rank: 0 },
  { name: "Album 3", artist: "Artist 3", description: "Words, words, words.", rank: 0 },
  { name: "Album 4", artist: "Artist 4", description: "Words, words, words.", rank: 0 }
]

albums.each do |album|
  Album.create album
end



books = [
  { name: "Book 1", author: "Author 1", description: "Words, words, words.", rank: 0 },
  { name: "Book 2", author: "Author 2", description: "Words, words, words.", rank: 0 },
  { name: "Book 3", author: "Author 3", description: "Words, words, words.", rank: 0 },
  { name: "Book 4", author: "Author 4", description: "Words, words, words.", rank: 0 }
]

books.each do |book|
  Book.create book
end
