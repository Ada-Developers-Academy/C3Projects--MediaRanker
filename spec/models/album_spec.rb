require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "model validations" do
    it "requires a title, all the time" do
      medium = Album.new

      expect(medium).to_not be_valid
      expect(medium.errors.keys).to include(:title)
    end

    context "validating rank" do
      ["pork", 3.14, -1].each do |invalid_rank|
        it "doesn't validate #{invalid_rank} for rank" do
          medium = Album.new(rank: invalid_rank)

          expect(medium).to_not be_valid
          expect(medium.errors.keys).to include(:rank)
        end
      end
    end
  end

  describe "ranked scope" do
    # positive test
    it "orders the albums descending by rank" do
      album1 = Album.create(title: 'a', rank: 1)
      album2 = Album.create(title: 'b', rank: 2)
      album3 = Album.create(title: 'c', rank: 3)

      expect(Album.ranked.first).to eq album3
    end

    # negative test
    it "does not order the albums by id" do
      album1 = Album.create(title: 'a', rank: 1)
      album2 = Album.create(title: 'b', rank: 2)
      album3 = Album.create(title: 'c', rank: 3)

      expect(Album.ranked.first).to_not eq Album.find(1)
    end
  end

  describe "top_ranked scope" do
    before :each do
      @album1 = Album.create(title: 'a', rank: 1)
      @album2 = Album.create(title: 'b', rank: 2)
      @album3 = Album.create(title: 'c', rank: 3)
      @album4 = Album.create(title: 'd', rank: 4)
      @album5 = Album.create(title: 'e', rank: 5)
      @album6 = Album.create(title: 'f', rank: 6)
      @album7 = Album.create(title: 'g', rank: 7)
      @album8 = Album.create(title: 'h', rank: 8)
      @album9 = Album.create(title: 'i', rank: 9)
      @album10 = Album.create(title: 'j', rank: 10)
      @album11 = Album.create(title: 'k', rank: 11)
      @album12 = Album.create(title: 'l', rank: 12)
    end

    # positive test
    it "orders the albums descending by rank" do
      expect(Album.top_ranked.first).to eq @album12
    end

    it "only has 10 elements" do
      expect(Album.top_ranked.count).to eq 10
    end

    # negative test
    it "does not order the albums by id" do
      expect(Album.top_ranked.first).to_not eq Album.find(1)
    end

    it "does not include the lowest ranking albums" do
      expect(Album.top_ranked).to_not include @album1
    end
  end
end
