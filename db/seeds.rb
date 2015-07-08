# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


media = [
  {name: "Pitch Perfect", description: "It's like mean girls", creator: "Jason Moore", format: "movie", votes: 0},
  {name: "How to train your dragon", description: "cute!", creator: "Pixar", format: "movie", votes: 0},
  {name: "The great gatsby", description: "sad", creator: "Fitzgerald", format: "book", votes: 0},
  {name: "The Count of Monte Cristo", description: "great ideas on how to get revenge", creator: "Alexandre Dumas", format: "book", votes: 0},
  {name: "Mercy", description: "chill", creator: "Active Child", format: "album", votes: 0},
  {name: "Crooks & Lovers", description: "cool", creator: "Mount Kimbie", format: "album", votes: 0}

]

media.each do |media|
  Medium.create media
end