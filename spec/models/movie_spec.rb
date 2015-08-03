require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "validates incoming data" do
    it "requires a name" do
      movie = Movie.new

      expect(movie).to_not be_valid
      expect(movie.errors.keys).to include(:name)
    end
  end

  describe "has top movies" do
    before :each do
      movie2 = Movie.create(name: "two", rank: 2)
      movie3 = Movie.create(name: "three", rank: 3)
      movie1 = Movie.create(name: "one", rank: 1)
      @movie0 = Movie.create(name: "zero", rank: 0)

      @top_movies = [movie3, movie2, movie1]
    end


    it "lists the top three movies" do
      expect(Movie.top(3).count).to eq(3)
    end

    it "ranks the top movies in order" do
      expect(Movie.top(3)).to match_array(@top_movies)
    end

    it "excludes lower ranked movies" do
      expect(Movie.top(3)).to_not include(@movie0)
    end

  end
end
