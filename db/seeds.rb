def random_number
  rand(0..200)
end

movies = Medium.create([
  {
    category: "Movie",
    upvotes: random_number,
    title: "The Fifth Element",
    creator: "Luc Besson",
    description: "A cab driver unwittingly becomes the central figure in the search for a legendary cosmic weapon to keep Evil at bay."
  },
  {
    category: "Movie",
    upvotes: random_number,
    title: "[Rec]",
    creator: "Jaume Balagueró & Paco Plaza",
    description: "A TV reporter follows emergency workers into an apartment building and is locked inside with something terrifying."
  },
  {
    category: "Movie",
    upvotes: random_number,
    title: "28 Days Later",
    creator: "Danny Boyle",
    description: "Four weeks after a mysterious, incurable virus spreads throughout the UK, a handful of survivors try to find sanctuary."
  },
  {
    category: "Movie",
    upvotes: random_number,
    title: "Låt den rätte komma in",
    creator: "Tomas Alfredson",
    description: "Oskar, an overlooked and bullied boy, finds love and revenge through Eli, a beautiful but peculiar girl."
  },
  {
    category: "Movie",
    upvotes: random_number,
    title: "Frostbiten",
    creator: "Anders Banke",
    description: "Vampires terrorize a city in Norrbotten."
  },
  {
    category: "Movie",
    upvotes: random_number,
    title: "Soldier's Girl",
    creator: "Frank Pierson" ,
    description: "The true story of the price a young soldier paid for falling in love with a transsexual night-club performer."
  },
  {
    category: "Movie",
    upvotes: random_number,
    title: "But I'm a Cheerleader",
    creator: "Jamie Babbit",
    description: "A naive teenager is sent to rehab camp when her straitlaced parents and friends suspect her of being a lesbian."
  },
  {
    category: "Movie",
    upvotes: random_number,
    title: "Sommerstrum",
    creator: "Marco Kreuzpaintner",
    description: "A close friendship between two crew teammates is tested when one slowly discovers he's gay and attracted to the other."
  },
  {
    category: "Movie",
    upvotes: random_number,
    title: "Yossi & Jagger",
    creator: "Eytan Fox",
    description: "Romance blooms between two soldiers (Knoller, Levi) stationed in an Israeli outpost on the Lebanese border."
  },
  {
    category: "Movie",
    upvotes: random_number,
    title: "Eurotrip",
    creator: "Jeff Schaffer",
    description: "Dumped by his girlfriend, a high school grad decides to embark on an overseas adventure in Europe with his friends."
  },
  {
    category: "Movie",
    upvotes: random_number,
    title: "Dark City",
    creator: "Alex Proyas",
    description: "A man struggles with memories of his past in a nightmarish world run by beings who seek the souls of humans."
  },
  {
    category: "Movie",
    upvotes: random_number,
    title: "Expedição Kon Tiki",
    creator: "Joachim Rønning & Espen Sandberg",
    description: "Legendary explorer Thor Heyerdal's epic 4,300-mile crossing of the Pacific on a balsawood raft in 1947."
  },
  {
    category: "Movie",
    upvotes: random_number,
    title: "Contact",
    creator: "Robert Zemeckis",
    description: "Dr. Ellie Arroway finds conclusive radio proof of intelligent aliens, who send plans for a mysterious machine."
  },
  {
    category: "Movie",
    upvotes: random_number,
    title: "K-PAX",
    creator: "Iain Softley",
    description: "Prot is a patient at a mental hospital who claims to be from a far away Planet."
  },
  {
    category: "Movie",
    upvotes: random_number,
    title: "District 9",
    creator: "Neill Blomkamp",
    description: "Aliens forced to live in slum-like conditions on Earth find a kindred spirit in a human exposed to their biotechnology."
  },
  {
    category: "Movie",
    upvotes: random_number,
    title: "Sphere",
    creator: "hahahahahaha",
    description: "STOP CALLING ME JERRY!"
  }
])

books = Medium.create([
  {
    category: "Book",
    upvotes: random_number,
    title: "Blood Music",
    creator: "Greg Bear"
  },
  {
    category: "Book",
    upvotes: random_number,
    title: "Red Mars",
    creator: "Kim Stanley Robinson"
  },
  {
    category: "Book",
    upvotes: random_number,
    title: "Blue Mars",
    creator: "Kim Stanley Robinson"
  },
  {
    category: "Book",
    upvotes: random_number,
    title: "Green Mars",
    creator: "Kim Stanley Robinson"
  },
  {
    category: "Book",
    upvotes: random_number,
    title: "The Cobra Event",
    creator: "Richard Preston"
  },
  {
    category: "Book",
    upvotes: random_number,
    title: "The Postman",
    creator: "David Brin"
  },
  {
    category: "Book",
    upvotes: random_number,
    title: "The Color of Distance",
    creator: "Amy Thomson"
  },
  {
    category: "Book",
    upvotes: random_number,
    title: "Through Alien Eyes",
    creator: "Amy Thomson"
  },
  {
    category: "Book",
    upvotes: random_number,
    title: "The Lost World",
    creator: "Sir Arthur Conan Doyle"
  },
  {
    category: "Book",
    upvotes: random_number,
    title: "A Civil Action",
    creator: "Jonathan Harr"
  },
  {
    category: "Book",
    upvotes: random_number,
    title: "The Peace War",
    creator: "Vernor Vinge"
  },
  {
    category: "Book",
    upvotes: 9_000 + random_number, # I love this book the most.
    title: "Darwin's Radio",
    creator: "Greg Bear"
  },
  {
    category: "Book",
    upvotes: 9_000 + random_number, # I also love this book the most.
    title: "Earth",
    creator: "David Brin"
  }
])

albums = Medium.create([
  {
    category: "Album",
    upvotes: random_number,
    title: "Kompressor Does Not Dance",
    creator: "Kompressor"
  },
  {
    category: "Album",
    upvotes: random_number,
    title: "Unzertrennlich",
    creator: "Revolverheld"
  },
  {
    category: "Album",
    upvotes: random_number,
    title: "Ich laufe",
    creator: "Tim Bendzko"
  },
  {
    category: "Album",
    upvotes: random_number,
    title: "비가",
    creator: "김범수"
  },
  {
    category: "Album",
    upvotes: random_number,
    title: "白夜 ~~True Light~~",
    creator: "宮本 駿一"
  },
  {
    category: "Album",
    upvotes: random_number,
    title: "넌 내게 반했어",
    creator: "노브레인"
  }
])
