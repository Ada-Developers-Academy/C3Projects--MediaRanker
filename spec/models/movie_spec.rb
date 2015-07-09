require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "model validations" do
    it "requires a name to be present" do
      movie = Movie.new

      expect(movie).to_not be_valid
      expect(movie.errors.keys).to include(:name)
    end

    it "requires a unique name" do
      movie1 = Movie.create(name: "a movie", director: "director", desc: "desc", vote: 0)
      movie2 = Movie.create(name: "a movie", director: "director", desc: "desc", vote: 0)

      expect(movie2).to_not be_valid
      expect(movie2.errors.keys).to include(:name)
    end

    it "defaults votes to 0" do
      movie = Movie.create(name: "name")

      expect(movie.vote).to eq 0
    end
  end

  describe ":best scope" do
    before :each do
      @movie4 = Movie.create(name: "a movie", director: "director", desc: "desc", vote: 8)
      @movie1 = Movie.create(name: "b movie", director: "director", desc: "desc", vote: 4)
      @movie3 = Movie.create(name: "c movie", director: "director", desc: "desc", vote: 19)
      @movie2 = Movie.create(name: "d movie", director: "director", desc: "desc", vote: 38)
    end

    it "sorts the movies in descending order by # of votes" do
      correct_order = [@movie2, @movie3, @movie4, @movie1]
      expect(Movie.best(4)).to eq correct_order
    end
  end
end
