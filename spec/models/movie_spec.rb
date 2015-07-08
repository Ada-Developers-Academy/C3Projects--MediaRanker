require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "model validations" do
    it "requires a name all the time" do
      movie = Movie.new

      expect(movie).to_not be_valid
      expect(movie.errors.keys).to include(:name)
    end
  end

  describe "best scope" do
    it "displays just 10 movies with ranking in desc order" do
      movie1  = Movie.create(name: "name1", director: "director1", description: "description1", ranking: 1)
      movie2  = Movie.create(name: "name2", director: "director2", description: "description2", ranking: 2)
      movie3  = Movie.create(name: "name3", director: "director3", description: "description3", ranking: 3)
      movie4  = Movie.create(name: "name4", director: "director4", description: "description4", ranking: 4)
      movie5  = Movie.create(name: "name5", director: "director5", description: "description5", ranking: 5)
      movie6  = Movie.create(name: "name6", director: "director6", description: "description6", ranking: 6)
      movie7  = Movie.create(name: "name7", director: "director7", description: "description7", ranking: 7)
      movie8  = Movie.create(name: "name8", director: "director8", description: "description8", ranking: 8)
      movie9  = Movie.create(name: "name9", director: "director9", description: "description9", ranking: 9)
      movie10 = Movie.create(name: "name10", director: "director10", description: "description10", ranking: 10)
      movie11 = Movie.create(name: "name11", director: "director11", description: "description11", ranking: 11)
      movie12 = Movie.create(name: "name12", director: "director12", description: "description12", ranking: 12)

      desc_order = [movie12, movie11, movie10, movie9, movie8, movie7, movie6, movie5, movie4, movie3]
      expect(Movie.best).to eq desc_order
      expect(Movie.best.count).to eq 10
    end
  end

end
