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

    context "creator and description are optional" do
      it "allows creation of an album without a creator" do
        album = Album.new(title: 'a title', description: 'a description', rank: 5)

        expect(album).to be_valid
        expect(album.errors.keys).to_not include(:creator)
      end

      it "allows creation of an album without a description" do
        album = Album.new(title: 'a title', creator: 'a creator', rank: 5)

        expect(album).to be_valid
        expect(album.errors.keys).to_not include(:description)
      end
    end
  end

  describe "db defaults" do
    it "rank can be assigned explicitly" do
      album = Album.new(title: 'a title', rank: 5)

      expect(album.rank).to eq 5
    end

    it "rank defaults to 0 if no value entered" do
      album = Album.new(title: 'a title')

      expect(album.rank).to eq 0
    end
  end

  describe "ranked scope" do
    # positive test
    it "orders the albums descending by rank" do
      medium1 = Album.create(title: 'a', rank: 1)
      medium2 = Album.create(title: 'b', rank: 2)
      medium3 = Album.create(title: 'c', rank: 3)

      expect(Album.ranked.first).to eq medium3
    end

    # negative test
    it "does not order the albums by id" do
      medium1 = Album.create(title: 'a', rank: 1)
      medium2 = Album.create(title: 'b', rank: 2)
      medium3 = Album.create(title: 'c', rank: 3)

      expect(Album.ranked.first).to_not eq Album.find(1)
    end
  end

  describe "top_ranked scope" do
    before :each do
      @medium1 = Album.create(title: 'a', rank: 1)
      @medium2 = Album.create(title: 'b', rank: 2)
      @medium3 = Album.create(title: 'c', rank: 3)
      @medium4 = Album.create(title: 'd', rank: 4)
      @medium5 = Album.create(title: 'e', rank: 5)
      @medium6 = Album.create(title: 'f', rank: 6)
      @medium7 = Album.create(title: 'g', rank: 7)
      @medium8 = Album.create(title: 'h', rank: 8)
      @medium9 = Album.create(title: 'i', rank: 9)
      @medium10 = Album.create(title: 'j', rank: 10)
      @medium11 = Album.create(title: 'k', rank: 11)
      @medium12 = Album.create(title: 'l', rank: 12)
    end

    # positive test
    it "orders the albums descending by rank" do
      expect(Album.top_ranked.first).to eq @medium12
    end

    it "only has 10 elements" do
      expect(Album.top_ranked.count).to eq 10
    end

    # negative test
    it "does not order the albums by id" do
      expect(Album.top_ranked.first).to_not eq Album.find(1)
    end

    it "does not include the lowest ranking albums" do
      expect(Album.top_ranked).to_not include @medium1
    end
  end

  describe "add_vote method" do
    it "increases rank of an album" do
      album = Album.create(title: 'a', rank: 5)
      album.add_vote

      expect(album.rank).to eq 6
    end
  end
end
