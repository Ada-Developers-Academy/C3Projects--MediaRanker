# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [
  {title: "Wet Hot American Summer",
    director: "David Wain",
    rank: 3,
    description: "Serious coming-of-age drama."},
  {title: "The Shining",
    director: "Stanley Kubrick",
    rank: 6,
    description: "Lighthearted romp about a vacationing family."}
]

movies.each do |movie|
  Movie.create(movie)
end

# books = [
#   {title: "Infinite Jest",
#     author: "David Foster Wallace",
#     rank: 3,
#     description: "Short fiction about puppies."},
#   {title: "2666",
#     author: "Roberto Bolano",
#     rank: 6,
#     description: "Short fiction about kitties."}
# ]
#
# books.each do |book|
#   Book.create(book)
# end
