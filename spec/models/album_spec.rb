require 'rails_helper'

RSpec.describe Album, type: :model do

  describe "model validations " do
    before(:each) do
      @album = Album.new
    end

    it "requires a name, all the time" do
      # testing that it's failing b/c title is required
      expect(@album).to_not be_valid
      expect(@album.errors.keys).to include(:name)
    end
  end # validations

  describe "scopes" do

    context "top scope" do

      it "top retrieves the first 5 albums from highest rank to lowest" do

      album1 = Album.create(name: "a", rank: 1)
      album6 = Album.create(name: "a", rank: 6)
      album4 = Album.create(name: "a", rank: 4)
      album2 = Album.create(name: "a", rank: 2)
      album5 = Album.create(name: "a", rank: 5)
      album3 = Album.create(name: "a", rank: 3)

      top = [album6, album5, album4]

      expect(Album.top(3)).to eq(top)
      end
    end # context top

    context "by_rank scope" do
      it "sorts albums from highest to lowest rank" do

        album1 = Album.create(name: "a", rank: 1)
        album6 = Album.create(name: "a", rank: 6)
        album4 = Album.create(name: "a", rank: 4)
        album2 = Album.create(name: "a", rank: 2)
        album5 = Album.create(name: "a", rank: 5)
        album3 = Album.create(name: "a", rank: 3)

        rank_order = [album6, album5, album4, album3, album2, album1]

        expect(Album.by_rank.first).to eq(album6)
        expect(Album.by_rank.last).to eq(album1)
        expect(Album.by_rank).to eq(rank_order)
      end
    end # context by_rank
  end # scopes

end
