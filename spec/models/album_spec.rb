require 'rails_helper'

RSpec.describe Album, type: :model do

  describe "model validations " do
    it "requires a name, all the time" do
      album = Album.new

      expect(album).to_not be_valid
      expect(album.errors.keys).to include(:name)
      # testing that it's failing b/c title is required
    end

    context "scopes" do

      before(:all) do
        album1 = Album.create(name: "a", rank: 1)
        album6 = Album.create(name: "a", rank: 6)
        album4 = Album.create(name: "a", rank: 4)
        album2 = Album.create(name: "a", rank: 2)
        album5 = Album.create(name: "a", rank: 5)
        album3 = Album.create(name: "a", rank: 3)
      end

      it "top retrieves the first 5 albums from highest rank to lowest" do
        expect(Album.top(5)).to
      end

      describe "by_rank scope sorts albums from highest to lowest rank" do

      end
    end

  end
end
