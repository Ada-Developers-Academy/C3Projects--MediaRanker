require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe "model validations" do

    context "validating name"
      it "requires a name" do
        movie = Movie.new

        expect(movie).to_not be_valid
        expect(movie.errors.keys).to include(:name)
      end
    end

    context "rank validating"
      it "requires a rank" do
        movie = Movie.new

        expect(movie).to_not be_valid
        expect(movie.errors.keys).to include(:name)
      end

      ["one", 0.0, nil].each do |invalid_rank|
        it "requires rank to be an integer" do
          movie = Movie.new(name: "Test", rank: invalid_rank)

          expect(movie).to_not be_valid
          expect(movie.errors.keys).to include(:rank)
        end
      end
    end

  end

  describe "scope validations: best_first" do

    before :each do
      ranks = [2, 1, 3, 3, 4, 5, 0, 100, 50, 101, 24, 35, 0, 0, 40, -1, 51, -20]
      ranks.each do |rank|
        Movie.create(title: "Test #{rank}", rank: rank)
      end
      @excluded_movie = Movie.create(title: "Test", rank: 0)
      @included_movie = Movie.create(title: "Test", rank: 4)
    end

    it "ranks by highest number first" do
      expect(Movie.best_first(10).first).to eq(Movie.find(rank: 101))
    end

    it "includes the highest ranked movies (designated by total argument)" do
      expect(Movie.best_first(10).count).to eq 10
      expect(Movie.best_first(10)).to include(@included_movie)
    end

    it "excludes the lowest ranked movies (designated by total argument)" do
      expect(Movie.best_first(10)).to_not include(@excluded_movie)
    end

  end

  # describe "scope validations: best_first_all" do
  #
  #   it "ranks by highest number first" do
  #
  #   end
  #
  # end

end
