# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([
  { name: Movie },
  { name: Book },
  { name: Album }
])

movies = Movie.create([
  {
    name: "The Fifth Element",
    director: "Luc Besson",
    description: "A cab driver unwittingly becomes the central figure in the search for a legendary cosmic weapon to keep Evil at bay."
  },
  {
    name: "[Rec]",
    director: "Jaume Balagueró & Paco Plaza",
    description: "A TV reporter follows emergency workers into an apartment building and is locked inside with something terrifying."
  },
  {
    name: "28 Days Later",
    director: "Danny Boyle",
    description: "Four weeks after a mysterious, incurable virus spreads throughout the UK, a handful of survivors try to find sanctuary."
  },
  {
    name: "Låt den rätte komma in",
    director: "Tomas Alfredson",
    description: "Oskar, an overlooked and bullied boy, finds love and revenge through Eli, a beautiful but peculiar girl."
  },
  {
    name: "Frostbiten",
    director: "Anders Banke",
    description: "Vampires terrorize a city in Norrbotten."
  },
  {
    name: "Soldier's Girl",
    director: "Frank Pierson" ,
    description: "The true story of the price a young soldier paid for falling in love with a transsexual night-club performer."
  },
  {
    name: "But I'm a Cheerleader",
    director: "Jamie Babbit",
    description: "A naive teenager is sent to rehab camp when her straitlaced parents and friends suspect her of being a lesbian."
  },
  {
    name: "Sommerstrum",
    director: "Marco Kreuzpaintner",
    description: "A close friendship between two crew teammates is tested when one slowly discovers he's gay and attracted to the other."
  },
  {
    name: "Yossi & Jagger",
    director: "Eytan Fox",
    description: "Romance blooms between two soldiers (Knoller, Levi) stationed in an Israeli outpost on the Lebanese border."
  },
  {
    name: "Eurotrip",
    director: "Jeff Schaffer",
    description: "Dumped by his girlfriend, a high school grad decides to embark on an overseas adventure in Europe with his friends."
  },
  {
    name: "Dark City",
    director: "Alex Proyas",
    description: "A man struggles with memories of his past in a nightmarish world run by beings who seek the souls of humans."
  },
  {
    name: "Expedição Kon Tiki",
    director: "Joachim Rønning & Espen Sandberg",
    description: "Legendary explorer Thor Heyerdal's epic 4,300-mile crossing of the Pacific on a balsawood raft in 1947."
  },
  {
    name: "Contact",
    director: "Robert Zemeckis",
    description: "Dr. Ellie Arroway finds conclusive radio proof of intelligent aliens, who send plans for a mysterious machine."
  },
  {
    name: "K-PAX",
    director: "Iain Softley",
    description: "Prot is a patient at a mental hospital who claims to be from a far away Planet."
  },
  {
    name: "District 9",
    director: "Neill Blomkamp",
    description: "Aliens forced to live in slum-like conditions on Earth find a kindred spirit in a human exposed to their biotechnology."
  },
  {
    name: "Sphere",
    director: "hahahahahaha",
    description: "STOP CALLING ME JERRY!"
  }
])

books = Book.create([
  {
    name: "Blood Music",
    author: "Greg Bear"
  },
  {
    name: "Red Mars",
    author: "Kim Stanley Robinson"
  },
  {
    name: "Blue Mars",
    author: "Kim Stanley Robinson"
  },
  {
    name: "Green Mars",
    author: "Kim Stanley Robinson"
  },
  {
    name: "The Cobra Effect"
  },
  {
    name: "Eon"
  },
  {
    name: "The Color of Distance",
    author: "Kim Stanley Robinson"
  },
  {
    name: "Red Mars",
    author: "Kim Stanley Robinson"
  },
  {
    name: "The Lost World",
    author: "Sir Arthur Conan Doyle"
  },
  {
    name: "A Civil Action"
  }
])

albums = Album.create([
  {
    name: "Kompressor Does Not Dance",
    artist: "Kompressor"
  }
])
