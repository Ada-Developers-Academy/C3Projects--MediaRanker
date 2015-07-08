require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "model validations" do

    before :each do
      @movie = Movie.new
      @movie.save
    end

    it "requires a name all the time" do
      expect(@movie.errors.keys).to include(:name)
    end

    it "requires a rank all the time" do
      expect(@movie.errors.keys).to include(:rank)
    end
  end

  context "validating rank" do
    it "requires rank to be an integer" do
      @movie = Movie.new(name: "Lovely", rank: "hi" )

      @movie.save

      expect(@movie.errors.keys).to include(:rank)
    end

    it "requires rank to be less than 200" do
      @movie = Movie.new(name: "Lovely", rank: 250)

      @movie.save

      expect(@movie.errors.keys).to include(:rank)
    end
  end
end
