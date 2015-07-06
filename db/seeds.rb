# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

books = [
  { title: "Sloth and Wrath", author: "Jane Austin", description: "Pride and Prejudice is a novel of manners by Jane Austen, first published in 1813. The story follows the main character Elizabeth Bennet as she deals with issues of sloth, wrath, morality, education, and marriage in the society of the landed gentry of early 19th-century England. Elizabeth is the second of five daughters of a country gentleman living near the fictional town of Meryton in Hertfordshire, near London.", ranking: 1}
]

books.each do |book|
  Book.create book
end

movies = [
  { title: "Bride and Prejudice", author: "Bollywood", description: "Pride and Prejudice as a musical", ranking: 1}
]

movies.each do |movie|
  Movie.create movie
end

albums = [
  { title: "20/20", author: "JT", description: "musaq", ranking: 1}
]

albums.each do |album|
  Album.create album
end
