books = [
  {name: "The Giver", author: "Lois Lowry", desc: "Young-adult fiction dystopian novel", vote: 5},
  {name: "The Lovely Bones", author: "Alice Sebold", desc: "It is the story of a teenage girl who, after being raped and murdered, watches from her personal Heaven as her family and friends struggle to move on with their lives while she comes to terms with her own death.", vote: 0},
  {name: "Siddartha", author: "Herman Hesse", desc: "A novel that deals with the spiritual journey of self-discovery of a man named Siddhartha during the time of the Gautama Buddha.", vote: 0},
  {name: "Charlotte's Web", author: "E.B. White", desc: "A pig and a spider befriend one another.", vote: 3},
  {name: "Freakonomics", author: "Stephen J. Dubner, Steven D. Levitt", desc: "A Rogue Economist Explores the Hidden Side of Everything", vote: 3}
]

books.each do |book|
  Book.create book
end

movies = [
  {name: "American Beauty", director: "Sam Mendes", desc: "1999 American drama film", vote: 5},
  {name: "The Royal Tenenbaums", director: "Wes Anderson", desc: "Weirdo family", vote: 0},
  {name: "Hedwig and the Angry Inch", director: "John Cameron Mitchell", desc: "A rock musical about a fictional rock and roll band fronted by a genderqueer East German singer named Hedwig.", vote: 0},
  {name: "Gattaca", director: "Andrew Niccol", desc: "A genetically inferior man assumes the identity of a superior one in order to pursue his lifelong dream of space travel.", vote: 3},
  {name: "Fight Club", director: "David Fincher", desc: "Cray cray", vote: 0}
]

movies.each do |movie|
  Movie.create movie
end

albums = [
  {name: "XO", artist: "Elliott Smith", desc: "Sadness", vote: 5},
  {name: "Funeral", artist: "Arcade Fire", desc: "Band", vote: 0},
  {name: "Revolver", artist: "The Beatles", desc: "For No One", vote: 0},
  {name: "Kind of Blue", artist: "Miles Davis", desc: "Jazz", vote: 3},
  {name: "Thriller", artist: "Michael Jackson", desc: "Zombies", vote: 0}
]

albums.each do |album|
  Album.create album
end
