require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "model validations" do
    it "requires a title, all the time" do
      medium = Movie.new

      expect(medium).to_not be_valid
      expect(medium.errors.keys).to include(:title)
    end

    context "validating rank" do
      ["pork", 3.14, -1].each do |invalid_rank|
        it "doesn't validate #{invalid_rank} for rank" do
          medium = Movie.new(rank: invalid_rank)

          expect(medium).to_not be_valid
          expect(medium.errors.keys).to include(:rank)
        end
      end
    end
  end

    describe "ranked scope" do
    # positive test
    it "orders the movies descending by rank" do
      medium1 = Movie.create(title: 'a', rank: 1)
      medium2 = Movie.create(title: 'b', rank: 2)
      medium3 = Movie.create(title: 'c', rank: 3)

      expect(Movie.ranked.first).to eq medium3
    end

    # negative test
    it "does not order the movies by id" do
      medium1 = Movie.create(title: 'a', rank: 1)
      medium2 = Movie.create(title: 'b', rank: 2)
      medium3 = Movie.create(title: 'c', rank: 3)

      expect(Movie.ranked.first).to_not eq Movie.find(1)
    end
  end

  describe "top_ranked scope" do
    before :each do
      @medium1 = Movie.create(title: 'a', rank: 1)
      @medium2 = Movie.create(title: 'b', rank: 2)
      @medium3 = Movie.create(title: 'c', rank: 3)
      @medium4 = Movie.create(title: 'd', rank: 4)
      @medium5 = Movie.create(title: 'e', rank: 5)
      @medium6 = Movie.create(title: 'f', rank: 6)
      @medium7 = Movie.create(title: 'g', rank: 7)
      @medium8 = Movie.create(title: 'h', rank: 8)
      @medium9 = Movie.create(title: 'i', rank: 9)
      @medium10 = Movie.create(title: 'j', rank: 10)
      @medium11 = Movie.create(title: 'k', rank: 11)
      @medium12 = Movie.create(title: 'l', rank: 12)
    end

    # positive test
    it "orders the movies descending by rank" do
      expect(Movie.top_ranked.first).to eq @medium12
    end

    it "only has 10 elements" do
      expect(Movie.top_ranked.count).to eq 10
    end

    # negative test
    it "does not order the movies by id" do
      expect(Movie.top_ranked.first).to_not eq Movie.find(1)
    end

    it "does not include the lowest ranking movies" do
      expect(Movie.top_ranked).to_not include @medium1
    end
  end
end
