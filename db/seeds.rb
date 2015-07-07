# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [
  {name: "Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb", director: "Stanley Kubric", description: "An insane general starts a process to nuclear holocaust that a war room of politicians and generals frantically try to stop. lalalala", ranking: 79},
  {name: "The Fall", director: "Tarsem Singh", description:  "In a hospital on the outskirts of 1920s Los Angeles, an injured stuntman begins to tell a fellow patient, a little girl with a broken arm, a fantastic story of five mythical heroes. Thanks to his fractured state of mind and her vivid imagination, the line between fiction and reality blurs as the tale advances.", ranking: 25},
  {name: "Boo the Sociopathic Entity", director: "Kimmie", description: "Meet Boo the Anti-Friendly Entity!", ranking: 25},
  {name: "Bz Movie", director: "Dr. Walentin", description:"this is a test", ranking: 1}
]

movies.each do |movie|
  Movie.create movie
end

books = [
  {name: "Puns, or How I Expressed my Love for ADA", author: "Lizzy U is Watching U", description: " Just seeing if Elizabeth is watching. Just to see if Blake is watching. Eyeballs Who really created this book? Also, speaking of eyeballs, has anyone seen my ball? FOUND. But has anyone seen my nut?", ranking: 165},
  {name: "Sloth and Wrath", author: "Jane Austen",  description: "Pride and Prejudice is a novel of manners by Jane Austen, first published in 1813. The story follows the main character Elizabeth Bennet as she deals with issues of sloth, wrath, morality, education, and marriage in the society of the landed gentry of early 19th-century England. Elizabeth is the second of five daughters of a country gentleman living near the fictional town of Meryton in Hertfordshire, near London.", ranking: 54},
  {name: "Bossy Pants", author: "Tina Fey",  description: "Her pants are so bossy", ranking: 25},
  {name: "Such Ranking, Many Things", author: "Doge", description: "wow. lorem graphic. many CSS. very layout. lorem doge. such placeholder. Stephanie, did you make this?", ranking: 24},
  {name: "Mary's Little Lamb", author: "Baa Baa Black Sheep", description: "Snow white fleece, has a definite whose my mother complex, you get the idea. She's a total mama's girl."}
]

books.each do |book|
  Book.create book
end

albums = [
  {name: "Awake", artist: "Tycho", description: "So chill", ranking: 8},
  {name: "Fate's Brother: Greatest Hits", artist: "Fate's Brother", description: "Soulfuol and sassy", ranking: 7}
]

albums.each do |album|
  Album.create album
end
