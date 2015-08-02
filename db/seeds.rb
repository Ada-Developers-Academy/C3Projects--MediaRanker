# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [
  { name: "Wedding Crashers", director: "Bob", description: "Guys crashing weddings", rank: 10},
  { name: "Finding Nemo", director: "Mary", description: "This fish gets lost and you do not know if he will find his dad or not.", rank: 70},
  { name: "He's Just Not That Into You", director: "Joe", description: "A lot of famous people have issues with love.", rank: 10 },
  { name: "The Blind Side", director: "Milton", description: "A sassy southern lady adopts a kid and pushes him into football, where he succeeds and ends up making a lot of money.", rank: 24 },
  { name: "Mary Poppins", director: "Sarah", description: "This magical babysitter shows up and helps watch this family's kids and feeds them cough syrup and sings them songs and they get happier.", rank: 4 },
  { name: "How to Lose a Guy In 10 Days", director: "Katy", description: "A journalist and sales guy get in simultaneous competitions to push a bf away and keep a gf, respectively. A lot of humorous events happen after that.", rank: 32},
]

movies.each do |movie|
  Movie.create movie
end

books = [
  { name: "Lean In", author: "Sheryl", description: "Women are awesome and should sit at the table more", rank: 1000},
  { name: "Curious George Goes To The Zoo", author: "Mary", description: "This monkey goes to the zoo", rank: 72},
  { name: "Martian", author: "Joe", description: "Scary cool science things happen in space and this astronaut has to survive alone.", rank: 20 },
  { name: "Eat, Pray, Love", author: "Milton", description: "A lady goes to 3 different countries and eats, prays and loves in them respectively while learning things about life.", rank: 240 },
  { name: "Outlander", author: "Diana", description: "A lady goes back in time to kilt-wearing Scotland time and has issues with the timechange.", rank: 40 },
]

books.each do |book|
  Book.create book
end

albums = [
  { name: "Don Omar Presents MTO2: New Generation", artist: "Don Omar", description: "Latin awesomeness", rank: 242},
  { name: "V", artist: "Maroon 5", description: "Pop stuff", rank: 720},
  { name: "Night Visions", artist: "Imagine Dragons", description: "All of the best things.", rank: 20000 },
  { name: "Til the Casket Drops", artist: "ZZ Ward", description: "Soul-Pop Magic", rank: 540 },
  { name: "Believe", artist: "Justin Bieber", description: "Pre-Psycho-Justin", rank: 40 },
]

albums.each do |album|
  Album.create album
end
