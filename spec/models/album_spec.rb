require 'rails_helper'

RSpec.describe Album, type: :model do
describe "model validations" do
  it "requires a name" do
    album = Album.new

    expect(album).to_not be_valid
    expect(album.errors.keys).to include(:name)
    end
  end

  describe "ranking scope" do

    before :each do
      @album1 = Album.create(name: "Cool Album", creator: "some person", description: "cool", rank: 5)
      @album2 = Album.create(name: "Rad Album", creator: "some person", description: "rad", rank: 11)
      @album3 = Album.create(name: "Neat Album", creator: "some person", description: "neat", rank: 3)
    end

    it "returns n number of Albums based on argument" do

      correct_order = [@album2, @album1]
      expect(Album.ranking(2)).to eq correct_order
    end

    it "returns an ordered list of top ranked Albums" do

      correct_order = [@album2, @album1, @album3]
      expect(Album.ranking(3)).to eq correct_order
    end

    it "includes only the top ranked album when total equals 1" do
      expect(Album.ranking(1).count).to eq 1
      expect(Album.ranking(1)).to_not include (@album1)
    end
  end

  describe "add_vote" do
    before :each do
      @album1 = Album.create(name: "Cool Album", creator: "some person", description: "cool", rank: 5)
    end
    it "adds 1 to an album rank" do
      @album1.add_vote

      expect(@album1.rank).to eq 6
    end
  end

end
