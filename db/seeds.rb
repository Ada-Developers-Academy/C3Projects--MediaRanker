# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# MOVIES -----------------------------------------------------------------------
movies = [
  {
    name: "Gattaca",
    creator: "Andrew Niccol",
    description: "A genetically inferior man assumes the identity of a superior one in order to pursue his lifelong dream of space travel."
  },
  {
    name: "The Fifth Element",
    creator: "Luc Besson",
    description: "In the colorful future, a cab driver unwittingly becomes the central figure in the search for a legendary cosmic weapon to keep Evil and Mr Zorg at bay."
  }
]

movies.each { |movie| Movie.create(movie) }

# ALBUMS ----------------------------------------------------------------------

albums = [
  {
    name: "The Soul Cages",
    creator: "Sting",
    description: "About a mariner"
  },
  {
    name: "Chicken-n-Beer",
    creator: "Ludacris",
    description: "Rap"
  }
]

albums.each { |album| Album.create(album) }

# BOOKS -----------------------------------------------------------------------

books = [
  {
    name: "Harry Potter and the Deathly Hallows",
    creator: "J. K. Rowling",
    description: "The saga concludes."
  },
  {
    name: "Going Postal",
    creator: "Terry Pratchett",
    description: "The Postal Service has never been more exciting."
  }
]

books.each { |book| Book.create(book) }
