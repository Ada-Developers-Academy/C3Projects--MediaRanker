require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "model validations" do
    it "requires a name to be present" do
      album = Album.new

      expect(album).to_not be_valid
      expect(album.errors.keys).to include(:name)
    end

    it "requires a unique name" do
      album1 = Album.create(name: "a album", artist: "artist", desc: "desc", vote: 0)
      album2 = Album.create(name: "a album", artist: "artist", desc: "desc", vote: 0)

      expect(album2).to_not be_valid
      expect(album2.errors.keys).to include(:name)
    end
  end

  describe ":best scope" do
    before :each do
      @album4 = Album.create(name: "a album", artist: "artist", desc: "desc", vote: 8)
      @album1 = Album.create(name: "b album", artist: "artist", desc: "desc", vote: 4)
      @album3 = Album.create(name: "c album", artist: "artist", desc: "desc", vote: 19)
      @album2 = Album.create(name: "d album", artist: "artist", desc: "desc", vote: 38)
    end

    it "sorts the albums in descending order by # of votes" do
      correct_order = [@album2, @album3, @album4, @album1]
      expect(Album.best(4)).to eq correct_order
    end
  end
end
