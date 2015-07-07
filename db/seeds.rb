books = [
  {name: "The Giver", author: "Lois Lowry", desc: "Young-adult fiction dystopian novel", vote: 0},
  {name: "The Lovely Bones", author: "Alice Sebold", desc: "It is the story of a teenage girl who, after being raped and murdered, watches from her personal Heaven as her family and friends struggle to move on with their lives while she comes to terms with her own death.", vote: 0},
  {name: "Siddartha", author: "Herman Hesse", desc: "A novel that deals with the spiritual journey of self-discovery of a man named Siddhartha during the time of the Gautama Buddha.", vote: 0},
  {name: "Charlotte's Web", author: "E.B. White", desc: "A pig and a spider befriend one another.", vote: 0},
  {name: "Freakonomics", author: "Stephen J. Dubner, Steven D. Levitt", desc: "A Rogue Economist Explores the Hidden Side of Everything", vote: 0},
  {name: "And Then There Were None", author: "Agatha Christie", desc: "The world's best selling mystery and Christie's best novel.", vote: 0},
  {name: "Night", author: "Elie Wiesel", desc: "A work by Elie Wiesel about his experience with his father in the Nazi German concentration camps at Auschwitz and Buchenwald in 1944–45.", vote: 0},
  {name: "Woman Warrior", author: "Maxine Hong Kingston", desc: "Kingston blends autobiography with old Chinese folktales. What results is a complex portrayal of the 20th century experiences of Chinese-Americans living in the U.S in the shadow of the Chinese Revolution.", vote: 0}
]

books.each do |book|
  Book.create book
end

movies = [
  {name: "American Beauty", director: "Sam Mendes", desc: "A sexually frustrated suburban father has a mid-life crisis after becoming infatuated with his daughter's best friend.", vote: 0},
  {name: "The Royal Tenenbaums", director: "Wes Anderson", desc: "An estranged family of former child prodigies reunites when their father announces he is terminally ill.", vote: 0},
  {name: "Hedwig and the Angry Inch", director: "John Cameron Mitchell", desc: "A rock musical about a fictional rock and roll band fronted by a genderqueer East German singer named Hedwig.", vote: 0},
  {name: "Gattaca", director: "Andrew Niccol", desc: "A genetically inferior man assumes the identity of a superior one in order to pursue his lifelong dream of space travel.", vote: 0},
  {name: "Fight Club", director: "David Fincher", desc: "An insomniac office worker, looking for a way to change his life, crosses paths with a devil-may-care soap maker, forming an underground fight club that evolves into something much, much more", vote: 0},
  {name: "Interstellar", director: "Christopher Nolan", desc: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.", vote: 0},
  {name: "Whiplash", director: "Damien Chazelle", desc: "A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student's potential.", vote: 0},
  {name: "The Red Violin", director: "A perfect red-colored violin inspires passion, making its way through three centuries over several owners and countries, eventually ending up at an auction where it may find a new owner.", vote: 0}
]

movies.each do |movie|
  Movie.create movie
end

albums = [
  {name: "XO", artist: "Elliott Smith", desc: "Sadness", vote: 0},
  {name: "Funeral", artist: "Arcade Fire", desc: "Band", vote: 0},
  {name: "Revolver", artist: "The Beatles", desc: "For No One", vote: 0},
  {name: "Kind of Blue", artist: "Miles Davis", desc: "Jazz", vote: 0},
  {name: "Thriller", artist: "Michael Jackson", desc: "Zombies", vote: 0},
  {name: "An Awesome Wave", artist: "alt-J", desc: "Taro", vote: 0},
  {name: "In the Aeroplane Over the Sea", artist: "Neutral Milk Hotel", desc: "songs", vote: 0},
  {name: "The Anthology", artist: "A Tribe Called Quest", desc: "90s", vote: 0}
]

albums.each do |album|
  Album.create album
end
