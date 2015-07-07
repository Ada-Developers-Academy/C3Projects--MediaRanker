require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "model validation" do
    it "requires a name" do
      album = Album.new

      expect(album).to_not be_valid
      expect(album.errors.keys).to include(:name)
    end
  end

  describe "top scope" do
    it "returns albums in descending rank order" do
    album1 = Album.create(name: "Dark Side of the Moon", creator: "Pink Floyd", description: "Classic rock album", rank: 50)
    album2 = Album.create(name: "Truly Madly Deeply", creator: "Savage Garden", description: "Early nineties music that will get stuck in your head", rank: 20)
    album3 = Album.create(name: "Tracy Chapman", creator: "Tracy Chapman", description: "Debut album, full of classic songs", rank: 98)
    album4 = Album.create(name: "To the Teeth", creator: "Ani DiFranco", description: "First real live show I went to", rank: 60)

    correct_order = [album3, album4, album1, album2]
    expect(Album.top).to eq correct_order
    end
  end




end
