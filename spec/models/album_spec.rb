require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "model validations" do
    it "requires a name" do
      album = Album.new

      expect(album).to_not be_valid
      expect(album.errors.keys).to include(:name)
    end

    it "sets ranking to default of 0" do
      album = Album.new
      
      expect(album.ranking).to eq 0
    end
  end

  describe "top scope" do
    before :each do
      @album1 = Album.create(name: 'whatever', artist: 'some chick', description: 'whatever desc', ranking: 3)
      @album2 = Album.create(name: 'whatever', artist: 'some dude', description: 'description', ranking: 1)
      @album3 = Album.create(name: 'whatevz', artist: 'some chick', description: 'descrip', ranking: 2)
      @album4 = Album.create(name: 'whatevah', artist: 'some dude', description: 'descrip', ranking: 4)
    end

    it "orders albums according to ranking, highest to lowest" do
      top_albums = [@album4, @album1, @album3]
      expect(Album.top(3)).to eq(top_albums)
    end

    it "only displays given number of albums" do
      expect(Album.top(3).count).to eq 3
    end
  end
end
