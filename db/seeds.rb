# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

media = [
  {ranking: 0, name: "The Fry Chronicles", contributor: "Stephen Fry", description: "Stephen Fry is not just a multi-award-winning comedian and actor, but also an author, director and presenter. He is one of the most influential cultural forces in the country. This title details some of the most turbulent and least well known years of his life.", media_type: "book", user: "Sabrina"},
  {ranking: 0, name: "The Hippopotamus", contributor: "Stephen Fry", description: "So begins the tale of Ted Wallace, unaffectionately known as the Hippopotamus. Failed poet, failed theater critic, failed father and husband, Ted is a shameless womanizer, drinks too much, and is at odds in his cranky but maddeningly logical way with most of modern life.", media_type: "book", user: "Ash"},
  {ranking: 0, name: "V for Vendetta", contributor: "Stephen Fry", description: "Guy Fawkes masks", media_type: "movie", user: "Brock"},
  {ranking: 0, name: "Sherlock Holmes", contributor: "Stephen Fry", description: "Mycroft Holmes", media_type: "movie", user: "Misty"},
  {ranking: 0, name: "Current Puns", contributor: "Stephen Fry", description: "Exploration of wordplay", media_type: "album", user: "Brock"},
  {ranking: 0, name: "Loose Ends", contributor: "Stephen Fry", description: "Channel 4 series", media_type: "album", user: "Misty"},

]

media.each do |medium|
  Medium.create(medium)
end
