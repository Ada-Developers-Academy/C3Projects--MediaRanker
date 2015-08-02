# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [
  { name: "First Movie", director: "Spielberg" , description: "The first movie ever made", rank: 1 },
  { name: "Second Movie", director: "Hasselberg" , description: "The second movie ever made", rank: 3 },
  { name: "3rd Movie", director: "Spielberg" , description: "The third movie ever made", rank: 4 },
  { name: "Lala Movie", director: "Nolan" , description: "Boo you", rank: 2},
  { name: "Awesum Movie", director: "Will Smith" , description: "Fresh Prince Origins", rank: 5 },
  { name: "Hello Goodbye Movie", director: "Singer" , description: "The first movie ever made", rank: 6 }
]

movies.each do |movie|
  Movie.create movie
end

books = [
  { name: "First Book", author: "Rowling" , description: "The first book ever made", rank: 1 },
  { name: "Second Book", author: "Harold" , description: "The second book ever made", rank: 3 },
  { name: "3rd Book", author: "Arnold Noname" , description: "The third book ever made", rank: 5 },
  { name: "Lala Book", author: "Gerald" , description: "Boo you", rank: 4 },
  { name: "Awesum Book", author: "Helga Patacki" , description: "Fresh Prince Origins", rank: 6 },
  { name: "Hello Goodbye Book", author: "Woo Chang" , description: "The first book ever made", rank: 2 }
]

books.each do |book|
  Book.create book
end

albums = [
  { name: "First Album", artist: "Courage Dog" , description: "The first album ever made", rank: 1 },
  { name: "Second Album", artist: "Eustace Bag" , description: "The second album ever made", rank: 4 },
  { name: "3rd Album", artist: "Angry Beaver" , description: "The third album ever made", rank: 3 } ,
  { name: "Lala Album", artist: "Batman Superman" , description: "Boo you", rank: 2 },
  { name: "Awesum Album", artist: "X-men Evolution" , description: "Fresh Prince Origins", rank: 6 },
  { name: "Hello Goodbye Album", artist: "Fatboy Slim" , description: "The first album ever made", rank: 5 }
]

albums.each do |album|
  Album.create album
end
