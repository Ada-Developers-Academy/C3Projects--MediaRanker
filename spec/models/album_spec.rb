require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "model validations" do
    it "requires a title, all the time" do
      album = Album.new

      expect(album).to_not be_valid
      expect(album.errors.keys).to include(:title)
    end
  end

  describe "best(total) scope" do
    before :each do
      @album1 = Album.create(title: "a", votes: 1)
      @album2 = Album.create(title: "b", votes: 3)
      @album3 = Album.create(title: "c", votes: 2)
    end

    # positive test - includes a number of highest ranked albums
    it "includes a number of highest ranked albums" do
      correct_order = [@album2, @album3]
      expect(Album.best(2)).to eq correct_order
    end

    # negative test - excludes lower ranked albums
    it "excludes lower ranked albums" do
      expect(Album.best(2)).to_not include(@album1)
    end
  end

  describe "#upvote(album)" do
    it "increases the ranking" do
      album = Album.create(title: "a", votes: 1)
      Album.upvote(album)

      expect(album.votes).to eq 2
    end
  end
end
