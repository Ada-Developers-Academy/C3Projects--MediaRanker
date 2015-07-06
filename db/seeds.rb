# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

albums = [
  { name: "El Mariel", artist: "Pitbull", description: "ALL the Pitbull classics. ALL the club bangers.", ranking: 10 },
  { name: "Dutty Rock", artist: "Sean Paul", description: "This is the album with 'Baby Boy' feat. Beyonce. This is the song that launched Beyonce's solo career.", ranking: 3 },
  { name: "Word of Mouf", artist: "Ludacris", description: "Before Ludacris had money problems.", ranking: 14 },
  { name: "Under Construction", artist: "Missy Elliot", description: "The QUEEEEN.", ranking: 15 },
  { name: "Deja Entendu", artist: "Brand New", description: "For when you have too many feelings about your life.", ranking: 10 }
]

albums.each do |album|
  Album.create album
end

books = [
  { name: "The Baby-Sitters Club: The Truth about Stacey", author: "Ann M. Martin", description: "What up with Stacey though? You'll have to read and find out.", ranking: 10 },
  { name: "Pooh Gets Stuck", author: "Isabel Gaines", description: "It's as awkward as it sounds.", ranking: 10 },
  { name: "All My Friends are Dead", author: "Avery Monsen & Jory John", description: "Depressing book about dinosaurs.", ranking: 10 }
]

books.each do |book|
  Book.create book
end

movies = [
  { name: "Eternal Sunshine of the Spotless Mind", director: "Michel Gondry", description: "The best movie ever!!! Always makes me want to dye my hair afterwards...", ranking: 1 },
  { name: "Zoolander", director: "Ben Stiller", description: "Delving into the dark world of male modeling.", ranking: 10 },
  { name: "Pride & Prejudice", director: "Joe Wright", description: "Yeah, this is the one with Kiera Knightly and Matthew Macfayden and is the best version of this film!", ranking: 11 },
  { name: "Fight Club", director: "David Fincher", description: "The first rule is that you don't talk about Fight Club.", ranking: 10 },
  { name: "GOT TIRED OF LOOKING UP STUFF", director: "Me", description: "Whatever", ranking: 7 },
  { name: "STILL TIRED", director: "yeah yeah", description: "okay", ranking: 25 },
  { name: "YESNOYES", director: "Mr. WhatsHisFace", description: "this is about stuff.", ranking: 8 }
]

movies.each do |movie|
  Movie.create movie
end
