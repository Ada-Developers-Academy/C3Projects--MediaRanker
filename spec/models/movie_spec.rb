require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "model validations" do
    it "requires a name" do
      movie = Movie.new

      expect(movie).to_not be_valid
      expect(movie.errors.keys).to include(:name)
    end
  end

  describe "ranking scope" do

    before :each do
      @movie1 = Movie.create(name: "Cool Movie", director: "some person", description: "cool", rank: 5)
      @movie2 = Movie.create(name: "Rad Movie", director: "some person", description: "rad", rank: 11)
      @movie3 = Movie.create(name: "Neat Movie", director: "some person", description: "neat", rank: 3)
    end

    it "returns n number of movies based on argument" do

      correct_order = [@movie2, @movie1]
      expect(Movie.ranking(2)).to eq correct_order
    end

    it "returns an ordered list of top ranked movies" do

      correct_order = [@movie2, @movie1, @movie3]
      expect(Movie.ranking(3)).to eq correct_order
    end
  end

end
