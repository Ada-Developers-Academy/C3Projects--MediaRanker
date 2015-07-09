require 'rails_helper'
require 'support/shared_examples'

RSpec.describe Movie do
  it_behaves_like "a book"
end

RSpec.describe Movie, type: :model do

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
