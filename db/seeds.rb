# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

media = [
  {ranking: 0, name: "Bossypants", contributor: "Tina Fey", description: "She's funny", media_type: "book", user: "Sabrina"},
  {ranking: 0, name: "blue", contributor: "green", description: "red", media_type: "movie", user: "Ash"},
  {ranking: 0, name: "bowl", contributor: "fork", description: "spoon", media_type: "album", user: "Misty"},
]

media.each do |medium|
  Medium.create(medium)
end
