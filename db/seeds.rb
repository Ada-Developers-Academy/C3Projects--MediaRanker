# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

albums = [
  { title: "1989", artist: "Taylor Swift", description: "80's Inspired, 5th Studio Album for the Songstress and her first official Pop Album.", vote: 20},
  { title: "X", artist: "Ed Sheeran", description: "2nd official studio album from the English singer/songwriter.", vote: 22},
]

albums.each do |album|
  Album.create album
end

books = [
  { title: "To Kill A Mockingbird", author: "Harper Lee", description: "The unforgettable novel of a childhood in a sleepy Southern town and the crisis of conscience that rocked it, To Kill A Mockingbird became both an instant bestseller and a critical success when it was first published in 1960. It went on to win the Pulitzer Prize in 1961 and was later made into an Academy Award-winning film, also a classic.", vote: 10},
  { title: "Pride and Prejudice", author: "Jane Austen", description: "So begins Pride and Prejudice, Jane Austen's witty comedy of manners--one of the most popular novels of all time--that features splendidly civilized sparring between the proud Mr. Darcy and the prejudiced Elizabeth Bennet as they play out their spirited courtship in a series of eighteenth-century drawing-room intrigues", vote: 26},
]

books.each do |book|
  Book.create book
end

movies = [
  { title: "That Thing You Do!", director: "Tom Hanks", description: "Early boyband hijinx with a musical twist!", vote: 40},
  { title: "Charlies Angels", director: "Bret Ratner", description: "Three crime fighting heroines with fabulous hair solve crimes.", vote: 22},
]
movies.each do |movie|
  Movie.create movie
end
