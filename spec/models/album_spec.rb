require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "model validations" do
    it "requires a title" do
      album = Album.new
      expect(album).to_not be_valid
      expect(album.errors.keys).to include(:title)
    end

    it "requires an artist" do
      album = Album.new
      expect(album).to_not be_valid
      expect(album.errors.keys).to include(:author)
    end

    it "has a numerical ranking starting at 1" do
      album = Album.new(title: "a title", author: "someone")
      expect(album.ranking).to eq(1)
    end
  end
end
