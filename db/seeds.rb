# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [
  { name: "Back to the Future", director: "someone", description: "MARTY!!!", rank: 100 },
  { name: "Interstellar", director: "someone", description: "AMAZZING!", rank: 230 },
  { name: "The Mummy", director: "too lazy to look up", description: "He'll eat your eyes out.", rank: 34 },
  { name: "Harry Potter", director: "", description: "Entire series.", rank: 176 },
  { name: "Tangled", director: "Disney", description: "DISNEY!", rank: 23 },
  { name: "S1M0NE", director: "", description: "Obscure", rank: 3 },
  { name: "Gattaca", director: "", description: "GENES!!", rank: 45 }
]

movies.each do |movie|
  Movie.create movie
end

books = [
  { name: "Sabriel", author: "Garth Nix", description: "Amazing.", rank: 405 },
  { name: "Harry Potter", author: "J.K. Rowling", description: "Because a movie wasn't enough.", rank: 234 },
  { name: "Embassytown", author: "someone", description: "Interesting scifi.", rank: 100 },
  { name: "Left Hand of Darkness", author: "Ursula K. LeGuin", description: "I might have spelled her name wrong.", rank: 345 }
]

books.each do |book|
  Book.create book
end

albums = [
  { name: "Album #1", artist: "Artist #1", description: "Unique.", rank: 3 },
  { name: "Album #2", artist: "Artist #2", description: "Ho-hum.", rank: 4 },
  { name: "Album #3", artist: "Artist #3", description: "Okay.", rank: 7 },
  { name: "Album #4", artist: "Artist #1", description: "Because Artist #1 had to make more.", rank: 2 }
]

albums.each do |album|
  Album.create album
end
