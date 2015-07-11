require 'rails_helper'

RSpec.describe Album, type: :model do

  describe "model validations" do
    it "requires the presence of a name" do
      album = Album.new
      expect(album).to_not be_valid
      expect(album.errors.keys).to include(:name)
    end

    it "only albums with names will be recognized" do
      album = Album.new(name: "Nameless Album")
      expect(album).to be_valid
      expect(album.errors.keys).to_not include(:name)
    end

    # it "the rank should start at 0 for a new album" do
    #   album = Album.create(name: "name")
    #   expect(album.rank).to eq 0
    # end
  end
  describe "scopes" do

    context "ordered scope for albums#index page" do

      it "orders the list of all albums in descending order" do
        album1 = Album.create(:name => "First Album Name", :rank => 4)
        album2 = Album.create(:name => "2nd Album Name", :rank => 1 )
        album3 = Album.create(:name => "3rd Album Name", :rank => 2 )
        ordered_albums = [album1, album3, album2]
        expect(Album.ordered).to eq ordered_albums
      end
    end

    context "top scope for albums in the welcome#index page" do

      it "orders the list of all albums on the index page in descending order" do
        album1 = Album.create(:name => "First Album Name", :rank => 4)
        album2 = Album.create(:name => "2nd Album Name", :rank => 1 )
        album3 = Album.create(:name => "3rd Album Name", :rank => 2 )
        ordered_albums = [album1, album3, album2]
        expect(Album.top).to eq ordered_albums
      end

      # it "only lists the top albums" do
      #   album1 = Album.create(:name => "First Album Name", :rank => 10)
      #   album2 = Album.create(:name => "2nd Album Name", :rank => 25)
      #   album3 = Album.create(:name => "3rd Album Name", :rank => 18 )
      #   album4 = Album.create(:name => "Woo", :rank => 0)
      #   album5 = Album.create(:name => "Almost Dunzo", :rank => 20 )
      #   album6 = Album.create(:name => "Yupp", :rank => 30 )
      #   top_albums = [album6, album2, album5, album1, album3, album4]
      #   expect(Album.top).to eq top_albums
      # end

    end
  end
end
