# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
movies = [
  { title: "That Thing You Do!", director: "Tom Hanks", description: "Early boyband hijinx with a musical twist!", vote: 40},
  { title: "Charlies Angels", director: "Bret Ratner", description: "Three crime fighting heroines with fabulous hair solve crimes.", vote: 22},
]
movies.each do |movie|
  Movie.create movie
end
