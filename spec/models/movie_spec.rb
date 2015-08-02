require 'rails_helper'

RSpec.describe Movie, type: :model do 

  describe "model validations" do
    it "requires a name, description, and director all the time" do
      movie = Movie.new

      expect(movie).to_not be_valid
      expect(movie.errors.keys).to include(:name,:description,:director)
    end
  end

  describe "best scope" do
    it "ranks all the movies by vote in descending order" do
      movie1= Movie.create(name:'a', director:'b', description: 'c', vote:30)
      movie2= Movie.create(name:'a', director:'b', description: 'c', vote:3)
      movie3= Movie.create(name:'a', director:'b', description: 'c', vote:15)

      right_rank = [movie1, movie3, movie2]

      expect(Movie.best(3)).to eq right_rank
    end
  end
end

 





