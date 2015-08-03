def random_number
  rand(0..200)
end

categories = Category.create ([
  {
    name: "Movie", #1
    full_name: "Motion Picture",
    creator_noun: "Director",
    created_verb: "Directed"
  },
  {
    name: "Book", #2
    full_name: "Novel",
    creator_noun: "Author",
    created_verb: "Written"
  },
  {
    name: "Album", #3
    creator_noun: "Artist",
    created_verb: "Recorded"
  },
  {
    name: "Tv", #4
    full_name: "TV Show",
    creator_noun: "Creator",
    created_verb: "Created"
  },
  {
    name: "Webcomic", #5
    full_name: "Wobcomic",
    creator_noun: "Artist",
    created_verb: "Written & Drawn"
  },
  {
    name: "Game", #6
    creator_noun: "Company",
    created_verb: "Developed"
  }
])

movies = [
  {
    upvotes: random_number,
    title: "The Fifth Element",
    creator: "Luc Besson",
    description: "A cab driver unwittingly becomes the central figure in the search for a legendary cosmic weapon to keep Evil at bay."
  },
  {
    upvotes: random_number,
    title: "[Rec]",
    creator: "Jaume Balagueró & Paco Plaza",
    description: "A TV reporter follows emergency workers into an apartment building and is locked inside with something terrifying."
  },
  {
    upvotes: random_number,
    title: "28 Days Later",
    creator: "Danny Boyle",
    description: "Four weeks after a mysterious, incurable virus spreads throughout the UK, a handful of survivors try to find sanctuary."
  },
  {
    upvotes: random_number,
    title: "Låt den rätte komma in",
    creator: "Tomas Alfredson",
    description: "Oskar, an overlooked and bullied boy, finds love and revenge through Eli, a beautiful but peculiar girl."
  },
  {
    upvotes: random_number,
    title: "Frostbiten",
    creator: "Anders Banke",
    description: "Vampires terrorize a city in Norrbotten."
  },
  {
    upvotes: random_number,
    title: "Soldier's Girl",
    creator: "Frank Pierson" ,
    description: "The true story of the price a young soldier paid for falling in love with a transsexual night-club performer."
  },
  {
    upvotes: random_number,
    title: "But I'm a Cheerleader",
    creator: "Jamie Babbit",
    description: "A naive teenager is sent to rehab camp when her straitlaced parents and friends suspect her of being a lesbian."
  },
  {
    upvotes: random_number,
    title: "Sommerstrum",
    creator: "Marco Kreuzpaintner",
    description: "A close friendship between two crew teammates is tested when one slowly discovers he's gay and attracted to the other."
  },
  {
    upvotes: random_number,
    title: "Yossi & Jagger",
    creator: "Eytan Fox",
    description: "Romance blooms between two soldiers (Knoller, Levi) stationed in an Israeli outpost on the Lebanese border."
  },
  {
    upvotes: random_number,
    title: "Eurotrip",
    creator: "Jeff Schaffer",
    description: "Dumped by his girlfriend, a high school grad decides to embark on an overseas adventure in Europe with his friends."
  },
  {
    upvotes: random_number,
    title: "Dark City",
    creator: "Alex Proyas",
    description: "A man struggles with memories of his past in a nightmarish world run by beings who seek the souls of humans."
  },
  {
    upvotes: random_number,
    title: "Expedição Kon Tiki",
    creator: "Joachim Rønning & Espen Sandberg",
    description: "Legendary explorer Thor Heyerdal's epic 4,300-mile crossing of the Pacific on a balsawood raft in 1947."
  },
  {
    upvotes: random_number,
    title: "Contact",
    creator: "Robert Zemeckis",
    description: "Dr. Ellie Arroway finds conclusive radio proof of intelligent aliens, who send plans for a mysterious machine."
  },
  {
    upvotes: random_number,
    title: "K-PAX",
    creator: "Iain Softley",
    description: "Prot is a patient at a mental hospital who claims to be from a far away Planet."
  },
  {
    upvotes: random_number,
    title: "District 9",
    creator: "Neill Blomkamp",
    description: "Aliens forced to live in slum-like conditions on Earth find a kindred spirit in a human exposed to their biotechnology."
  },
  {
    upvotes: random_number,
    title: "Sphere",
    creator: "hahahahahaha",
    description: "STOP CALLING ME JERRY!"
  }
]

books = [
  {
    upvotes: random_number,
    title: "Blood Music",
    creator: "Greg Bear"
  },
  {
    upvotes: random_number,
    title: "Red Mars",
    creator: "Kim Stanley Robinson"
  },
  {
    upvotes: random_number,
    title: "Blue Mars",
    creator: "Kim Stanley Robinson"
  },
  {
    upvotes: random_number,
    title: "Green Mars",
    creator: "Kim Stanley Robinson"
  },
  {
    upvotes: random_number,
    title: "The Cobra Event",
    creator: "Richard Preston"
  },
  {
    upvotes: random_number,
    title: "The Postman",
    creator: "David Brin"
  },
  {
    upvotes: random_number,
    title: "The Color of Distance",
    creator: "Amy Thomson"
  },
  {
    upvotes: random_number,
    title: "Through Alien Eyes",
    creator: "Amy Thomson"
  },
  {
    upvotes: random_number,
    title: "The Lost World",
    creator: "Sir Arthur Conan Doyle"
  },
  {
    upvotes: random_number,
    title: "A Civil Action",
    creator: "Jonathan Harr"
  },
  {
    upvotes: random_number,
    title: "The Peace War",
    creator: "Vernor Vinge"
  },
  {
    upvotes: 9_000 + random_number, # I love this book the most.
    title: "Darwin's Radio",
    creator: "Greg Bear"
  },
  {
    upvotes: 9_000 + random_number, # I also love this book the most.
    title: "Earth",
    creator: "David Brin"
  },
  {
    upvotes: 9_000 + random_number, # Don't judge me!
    title: "커피프린스 1호점",
    creator: "이선미"
  }
]

albums = [
  {
    upvotes: random_number,
    title: "Kompressor Does Not Dance",
    creator: "Kompressor"
  },
  {
    upvotes: random_number,
    title: "Unzertrennlich",
    creator: "Revolverheld"
  },
  {
    upvotes: random_number,
    title: "Ich laufe",
    creator: "Tim Bendzko"
  },
  {
    upvotes: random_number,
    title: "비가",
    creator: "김범수"
  },
  {
    upvotes: random_number,
    title: "白夜 ~~True Light~~",
    creator: "宮本 駿一"
  },
  {
    upvotes: random_number,
    title: "넌 내게 반했어",
    creator: "노브레인"
  }
]

shows = [
  {
    upvotes: random_number,
    title: "Orange Is the New Black",
    creator: "Jenji Kohan"
  },
  {
    upvotes: random_number,
    title: "ラストエグザイル",
    creator: "村田 蓮爾"
  },
  {
    upvotes: random_number,
    title: "조선 여형사 다모",
    creator: "이재규"
  },
  {
    upvotes: random_number,
    title: "Scandal",
    creator: "Shonda Rhimes"
  }
]

comics = [
  {
    upvotes: random_number,
    title: "14 Nights",
    creator: "Kristina Stipetic"
  },
  {
    upvotes: 9_000 + random_number, # <3
    title: "Xkcd",
    creator: "Randall Munroe"
  },
  {
    upvotes: random_number,
    title: "Sinfest",
    creator: "Tatsuya Ishida"
  },
  {
    upvotes: random_number,
    title: "Gunnerkrigg Court",
    creator: "Tom Siddell"
  },
  {
    upvotes: random_number,
    title: "Dreamless",
    creator: "Bobby Crosby & Sarah Ellerton"
  },
  {
    upvotes: random_number,
    title: "The Phoenix Requiem",
    creator: "Sarah Ellerton"
  },
  {
    upvotes: random_number,
    title: "Scary Go Round",
    creator: "John Allison"
  },
  {
    upvotes: random_number,
    title: "Fey Winds",
    creator: "Nicole Chartrand"
  },
  {
    upvotes: random_number,
    title: "Red Moon Rising",
    creator: "Rose Loughran"
  },
  {
    upvotes: random_number,
    title: "Mokepon",
    creator: "H0lyhandgrenade"
  },
  {
    upvotes: 9_000 + random_number, # <3
    title: "A Redtail's Dream",
    creator: "Minna Sundberg"
  }
]

games = [
  {
    upvotes: random_number,
    title: "Carcassonne"
  },
  {
    upvotes: random_number,
    title: "Ticket to Ride"
  },
  {
    upvotes: random_number,
    title: "Mansions of Madness",
    creator: "Call of Cthulhu"
  },
  {
    upvotes: random_number,
    title: "Small World"
  },
  {
    upvotes: random_number,
    title: "Betrayal at the House on the Hill"
  },
  {
    upvotes: random_number,
    title: "Battleblock Theater"
  },
  {
    upvotes: random_number,
    title: "Mount Your Friends"
  },
  {
    upvotes: random_number,
    title: "No Luca No"
  },
  {
    upvotes: random_number,
    title: "Techo Kitten Adventure"
  },
  {
    upvotes: random_number,
    title: "Freecell"
  },
  {
    upvotes: random_number,
    title: "Minesweeper"
  },
  {
    upvotes: random_number,
    title: "Race for the Galaxy"
  },
  {
    upvotes: random_number,
    title: "Dominion"
  },
  {
    upvotes: random_number,
    title: "Mystery at the Abbey"
  },
  {
    upvotes: random_number,
    title: "Shadows over Waterdeep"
  }
]

movies.each do |movie|
  movie[:category_id] = 1
  Medium.create(movie)
end

books.each do |book|
  book[:category_id] = 2
  Medium.create(book)
end

albums.each do |album|
  album[:category_id] = 3
  Medium.create(album)
end

shows.each do |show|
  show[:category_id] = 4
  Medium.create(show)
end

comics.each do |comic|
  comic[:category_id] = 5
  Medium.create(comic)
end

games.each do |game|
  game[:category_id] = 6
  Medium.create(game)
end
