require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe "model validations" do
    it "requires the presence of a name" do
      movie = Movie.new
      expect(movie).to_not be_valid
      expect(movie.errors.keys).to include(:name)
    end

    it "only movies with names will be recognized" do
      movie = Movie.new(name: "Nameless Movie")
      expect(movie).to be_valid
      expect(movie.errors.keys).to_not include(:name)
    end
  end

  describe "scopes" do

    context "ordered scope for movies#index page" do

      it "orders the list of all movies in descending order" do
        movie1 = Movie.create(:name => "First Movie Name", :rank => 4)
        movie2 = Movie.create(:name => "2nd Movie Name", :rank => 1 )
        movie3 = Movie.create(:name => "3rd Movie Name", :rank => 2 )
        ordered_movies = [movie1, movie3, movie2]
        expect(Movie.ordered).to eq ordered_movies
      end
    end

    context "top scope for movies in the welcome#index page" do

      it "orders the list of all movies on the index page in descending order" do
        movie1 = Movie.create(:name => "First Movie Name", :rank => 4)
        movie2 = Movie.create(:name => "2nd Movie Name", :rank => 1 )
        movie3 = Movie.create(:name => "3rd Movie Name", :rank => 2 )
        ordered_movies = [movie1, movie3, movie2]
        expect(Movie.top).to eq ordered_movies
      end

    end
  end
end
