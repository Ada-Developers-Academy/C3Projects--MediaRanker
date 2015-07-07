books = [
  { title: "The Stars My Destination", author: "Alfred Bester", 
    description: "a super cool book" },
  { title: "Anna Karenina", author: "Leo Tolstoy", 
    description: "a super cool book" },
  { title: "Dealing with Dragons", author: "Patricia C. Wrede", 
    description: "a super cool book" },
  { title: "Graceling", author: "Kristin Cashore", 
    description: "a super cool book" },
  { title: "The Way of Kings", author: "Brandon Sanderson", 
    description: "a super cool book" },
  { title: "Atonement", author: "Ian McEwan", 
    description: "a super cool book" },
  { title: "The Silly Book", author: "Stoo Hample", 
    description: "a super cool book" },
  { title: "Wind from a Foreign Sky", author: "Katya Reimann", 
    description: "a super cool book" }
]

movies = [
  { title: "Ladyhawke", director: "Richard Donner", 
    description: "a super cool movie" },
  { title: "Star Wars", director: "George Lucas", 
    description: "a super cool movie" },
  { title: "Romancing the Stone", director: "Robert Zemeckis", 
    description: "a super cool movie" },
  { title: "Guardians of the Galaxy", director: "James Gunn", 
    description: "a super cool movie" },
  { title: "Harold and Maude", director: "Hal Ashby", 
    description: "a super cool movie" },
  { title: "Jesus Christ Superstar", director: "Norman Jewison", 
    description: "a super cool movie" },
  { title: "Wet Hot American Summer", director: "David Wain", 
    description: "a super cool movie" },
  { title: "Stargate", director: "Roland Emmerich", 
    description: "a super cool movie" }
]

albums = [
  { title: "Reflektor", artist: "Arcade Fire", 
    description: "a super cool album" },
  { title: "Sorry I'm Late", artist: "Cher Lloyd", 
    description: "a super cool album" },
  { title: "Barton Hollow", artist: "Civil Wars", 
    description: "a super cool album" },
  { title: "Rumours", artist: "Fleetwood Mac", 
    description: "a super cool album" },
  { title: "Same Trailer Different Park", artist: "Kacey Musgraves", 
    description: "a super cool album" },
  { title: "Animal", artist: "Ke$ha", 
    description: "a super cool album" },
  { title: "Fantasies", artist: "Metric", 
    description: "a super cool album" },
  { title: "Black Holes and Revelations", artist: "Muse", 
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
