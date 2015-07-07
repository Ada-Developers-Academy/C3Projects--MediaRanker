require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "model validations" do
    it "requires a title, all the time" do
      movie = Movie.new

      expect(movie).to_not be_valid
      expect(movie.errors.keys).to include(:title)
    end
  end

  describe "best(total) scope" do
    before :each do
      @movie1 = Movie.create(title: "a", votes: 1)
      @movie2 = Movie.create(title: "b", votes: 3)
      @movie3 = Movie.create(title: "c", votes: 2)
    end

    # positive test - includes a number of highest ranked movies
    it "includes a number of highest ranked movies" do
      correct_order = [@movie2, @movie3]
      expect(Movie.best(2)).to eq correct_order
    end

    # negative test - excludes lower ranked movies
    it "excludes lower ranked movies" do
      expect(Movie.best(2)).to_not include(@movie1)
    end
  end

  describe "#upvote(movie)" do
    it "increases the ranking" do
      movie = Movie.create(title: "a", votes: 1)
      Movie.upvote(movie)
      
      expect(movie.votes).to eq 2
    end
  end
end
