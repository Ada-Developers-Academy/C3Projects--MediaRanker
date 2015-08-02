require 'rails_helper'

RSpec.describe Album, type: :model do

  describe "validates incoming data" do
    it "requires a name" do
      album = Album.new

      expect(album).to_not be_valid
      expect(album.errors.keys).to include(:name)
    end
  end

  describe "has top albums" do
    before :each do
      @album0 = Album.create(name: "zero", rank: 0)
      album1 = Album.create(name: "one", rank: 1)
      album2 = Album.create(name: "two", rank: 2)
      album3 = Album.create(name: "three", rank: 3)

      @top_albums = [album3, album2, album1]
    end


    it "lists the top three albums" do
      expect(Album.top.count).to eq(3)
    end

    it "ranks the top albums in order" do
      expect(Album.top).to match_array(@top_albums)
    end

    it "excludes lower ranked albums" do
      expect(Album.top).to_not include(@album0)
    end

  end

end
