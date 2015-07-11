# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# MOVIES ------------------------------------------------------------------------------
movies = [
  [ "Harry Potter and the Sorcerer's Stone", "Chris Chris", "Okay", 1 ],
  [ "Star Wars: A New Hope", "George Lucas", "Awesome", 3 ]
]

movies.each do |title, director, description, rank|
  Movie.create(title: title, director: director, description: description, rank: rank)
end

# BOOKS ------------------------------------------------------------------------------
books = [
  [ "The Book Thief", "Markus Zusac", "so good", 2 ],
  [ "Harry Potter and the Prisoner of Azkaban", "J.K. Rowling", "the best", 1 ]
]

books.each do |title, author, description, rank|
  Book.create(title: title, author: author, description: description, rank: rank)
end

# ALBUMS ------------------------------------------------------------------------------
albums = [
  [ "Wilder Mind", "Mumford & Sons", "ohhh yeah", 15 ],
  [ "That's the Way of the World", "Earth, Wind, & Fire", "jammin'", 23 ]
]

albums.each do |title, artist, description, rank|
  Album.create(title: title, artist: artist, description: description, rank: rank)
end
