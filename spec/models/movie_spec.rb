require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "model validation" do
    it "requires a name" do
      movie = Movie.new

      expect(movie).to_not be_valid
      expect(movie.errors.keys).to include(:name)
    end
  end

  describe "top scope" do
    it "returns movies in descending rank order and limits to 10" do
      movie1 =  Movie.create(name: "The Wizard of Oz", rank: 102)
      movie2 =  Movie.create(name: "Love Actually", rank: 20)
      movie3 =  Movie.create(name: "Selma", rank: 80)
      movie4 =  Movie.create(name: "The Godfather", rank: 50)
      movie5 =  Movie.create(name: "Vivre Sa Vie", rank: 2)
      movie11 = Movie.create(name: "Jurassic Park", rank: 9)
      movie6 =  Movie.create(name: "Citizen Kane", rank: 98)
      movie7 =  Movie.create(name: "Inside Out", rank: 14)
      movie12 = Movie.create(name: "Clueless", rank: 1)
      movie8 =  Movie.create(name: "King Kong", rank: 12)
      movie9 =  Movie.create(name: "Mad Max")
      movie10 = Movie.create(name: "Snow White", rank: 10)

    correct_order = [movie1, movie6, movie3, movie4, movie2, movie7, movie8, movie10, movie11, movie5]
    expect(Movie.top).to eq correct_order
    end
  end


end
