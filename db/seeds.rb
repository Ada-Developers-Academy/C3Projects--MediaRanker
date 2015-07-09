# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# NOTE: only including `description: ""` on some
# because I'm playing with whether or not there's a difference,
# now that I set a default value in the model.
media = [
  { title: "Puppies Movie", creator: "Dog", votes: 10, format: "movie" },
  { title: "Kitties Movie", creator: "Cat", votes: 9, format: "movie" },
  { title: "Fishies Movie", creator: "Fish", format: "movie" },
  { title: "Llamas Movie", creator: "The Llama", votes: 6, format: "movie" },
  { title: "Orangutans Movie", creator: "Orangutan", votes: 7, format: "movie" },
  { title: "Elephants Movie", creator: "Elephant", description: "", format: "movie" },
  { title: "Puppies Book", creator: "Dog", votes: 10, description: "", format: "book" },
  { title: "Kitties Book", creator: "Cat", votes: 9, description: "", format: "book" },
  { title: "Fishies Book", creator: "Fish", description: "", format: "book" },
  { title: "Llamas Book", creator: "The Llama", votes: 6, description: "", format: "book" },
  { title: "Orangutans Book", creator: "Orangutan", votes: 7, description: "", format: "book" },
  { title: "Elephants Book", creator: "Elephant", description: "", format: "book" },
  { title: "Puppies Album", creator: "Dog", votes: 10, description: "", format: "album" },
  { title: "Kitties Album", creator: "Cat", votes: 9, description: "", format: "album" },
  { title: "Fishies Album", creator: "Fish", description: "", format: "album" },
  { title: "Llamas Album", creator: "The Llama", votes: 6, description: "", format: "album" },
  { title: "Orangutans Album", creator: "Orangutan", votes: 7, description: "", format: "album" },
  { title: "Elephants Album", creator: "Elephant", description: "", format: "album" }
]

media.each do |medium|
  Medium.create(medium)
end
