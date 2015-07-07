require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "model validations" do
    it "requires a name" do
      movie = Movie.new

      expect(movie).to_not be_valid
      expect(movie.errors.keys).to include(:name)
    end

    it "sets ranking to default of 0" do
      movie = Movie.new

      expect(movie.ranking).to eq 0
    end
  end

  describe "top scope" do
    before :each do
      @movie1 = Movie.create(name: 'whatever', director: 'some chick', description: 'whatever desc', ranking: 3)
      @movie2 = Movie.create(name: 'whatever', director: 'some dude', description: 'description', ranking: 1)
      @movie3 = Movie.create(name: 'whatevz',  director: 'some chick', description: 'descrip', ranking: 2)
      @movie4 = Movie.create(name: 'whatevah', director: 'some dude', description: 'descrip', ranking: 4)
    end

    it "orders movies according to ranking, highest to lowest" do
      top_movies = [@movie4, @movie1, @movie3]
      expect(Movie.top(3)).to eq(top_movies)
    end

    it "only displays given number of movies" do
      expect(Movie.top(3).count).to eq 3
    end
  end
end
