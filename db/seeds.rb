books = [
  { title: "The Stars My Destination", creator: "Alfred Bester", 
    description: "a super cool book" },
  { title: "Anna Karenina", creator: "Leo Tolstoy", 
    description: "a super cool book" },
  { title: "Dealing with Dragons", creator: "Patricia C. Wrede", 
    description: "a super cool book" },
  { title: "Graceling", creator: "Kristin Cashore", 
    description: "a super cool book" },
  { title: "The Way of Kings", creator: "Brandon Sanderson", 
    description: "a super cool book" },
  { title: "Atonement", creator: "Ian McEwan", 
    description: "a super cool book" },
  { title: "The Silly Book", creator: "Stoo Hample", 
    description: "a super cool book" },
  { title: "Wind from a Foreign Sky", creator: "Katya Reimann", 
    description: "a super cool book" }
]

movies = [
  { title: "Ladyhawke", creator: "Richard Donner", 
    description: "a super cool movie" },
  { title: "Star Wars", creator: "George Lucas", 
    description: "a super cool movie" },
  { title: "Romancing the Stone", creator: "Robert Zemeckis", 
    description: "a super cool movie" },
  { title: "Guardians of the Galaxy", creator: "James Gunn", 
    description: "a super cool movie" },
  { title: "Harold and Maude", creator: "Hal Ashby", 
    description: "a super cool movie" },
  { title: "Jesus Christ Superstar", creator: "Norman Jewison", 
    description: "a super cool movie" },
  { title: "Wet Hot American Summer", creator: "David Wain", 
    description: "a super cool movie" },
  { title: "Stargate", creator: "Roland Emmerich", 
    description: "a super cool movie" }
]

albums = [
  { title: "Reflektor", creator: "Arcade Fire", 
    description: "a super cool album" },
  { title: "Sorry I'm Late", creator: "Cher Lloyd", 
    description: "a super cool album" },
  { title: "Barton Hollow", creator: "Civil Wars", 
    description: "a super cool album" },
  { title: "Rumours", creator: "Fleetwood Mac", 
    description: "a super cool album" },
  { title: "Same Trailer Different Park", creator: "Kacey Musgraves", 
    description: "a super cool album" },
  { title: "Animal", creator: "Ke$ha", 
    description: "a super cool album" },
  { title: "Fantasies", creator: "Metric", 
    description: "a super cool album" },
  { title: "Black Holes and Revelations", creator: "Muse", 
    description: "a super cool album" }
]

books.each do |book|
  Book.create(book)
end

movies.each do |movie|
  Movie.create(movie)
end

albums.each do |album|
  Album.create(album)
end
