# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [
  {name: "Vivre Sa Vie", director: "Jean-Luc Goddard", description: "Live your life. Probably French.", rank: 2},
  {name: "The Wizard of Oz", director: "Mervin LeRoy", description: "There's a yellow brick road and a Dorothy and a scarecrow", rank: 100},
  {name: "Citizen Kane", director: "Orson Welles", description: "Study of the life of a newspaper tycoon", rank: 98},
  {name: "The Godfather", description: "Mafia something something", rank: 50},
  {name: "Mad Max", description: "post apocalyptic adventure time", rank: 1},
  {name: "It Happened One Night", description: "Do you know how weird people think you are if you do this?", rank: 1},
  {name: "King Kong", description: "Giant gorilla.", rank: 12},
  {name: "Selma", description: "Civil Rights", rank: 80},
  {name: "Snow White", description: "Girl and some dwarves and an evil stepmother", rank: 10},
  {name: "Love Actually", description: "A silly british christmas movie", rank: 20},
  {name: "Inside Out", description: "What would happen if feelings had feelings?", rank: 14}
]



movies.each do |movie|
  Movie.create movie
end
