require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "model validations" do
    it "requires a title all the time" do
      movie = Movie.new

      expect(movie).to_not be_valid
      expect(movie.errors.keys).to include(:title)
    end
  end

  describe "scope rank_order" do
    it "sorts the database in descending rank order" do
      movie1 = Movie.create(title: "HPCOS", director: "chris", description: "blah", rank: 3)
      movie2 = Movie.create(title: "HPGOF", director: "not chris", description: "dragons!", rank: 7)
      movies = Movie.all

      correct_order = [movie2, movie1]

      expect(movies.rank_order).to eq correct_order
    end
  end
end
