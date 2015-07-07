# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [
  {name: "Vivre Sa Vie", creator: "Jean-Luc Goddard", description: "Live your life. Probably French.", rank: 2},
  {name: "The Wizard of Oz", creator: "Mervin LeRoy", description: "There's a yellow brick road and a Dorothy and a scarecrow", rank: 100},
  {name: "Citizen Kane", creator: "Orson Welles", description: "Study of the life of a newspaper tycoon", rank: 98},
  {name: "The Godfather", description: "Mafia something something", rank: 50},
  {name: "Mad Max", description: "post apocalyptic adventure time", rank: 1},
  {name: "It Happened One Night", description: "Do you know how weird people think you are if you do this?", rank: 1},
  {name: "King Kong", description: "Giant gorilla.", rank: 12},
  {name: "Selma", description: "Civil Rights", rank: 80},
  {name: "Snow White", description: "Girl and some dwarves and an evil stepmother", rank: 10},
  {name: "Love Actually", description: "A silly british christmas movie", rank: 20},
  {name: "Inside Out", description: "What would happen if feelings had feelings?", rank: 14}
]

albums = [
  {name: "Dark Side of the Moon", creator: "Pink Floyd", description: "Classic rock album", rank: 50},
  {name: "Truly Madly Deeply", creator: "Savage Garden", description: "Early nineties music that will get stuck in your head", rank: 20},
  {name: "Tracy Chapman", creator: "Tracy Chapman", description: "Debut album, full of classic songs", rank: 98},
  {name: "To the Teeth", creator: "Ani DiFranco", description: "First real live show I went to", rank: 60}
]

books = [
  {name: "Pride and Prejudice", creator: "Jane Austen", description: "Classic literature. Kelli has many many copies", rank: 50},
  {name: "1984", creator: "George Orwell", description: "Dystopian future of Big Brother", rank: 60},
  {name: "The Kite Runner", creator: "Khaled Hosseini", description: "Childhood in Kabul, friendship and kites", rank: 68},
  {name: "To Kill a Mockingbird", creator: "Harper Lee", description: "Childhood in a sleepy southern town", rank: 40}
]

movies.each do |movie|
  Movie.create movie
end

albums.each do |album|
  Album.create album
end

books.each do |book|
  Book.create book
end
