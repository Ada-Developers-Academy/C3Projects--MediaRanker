require 'rails_helper'

RSpec.describe Book, type: :model do
  describe ":top_5 scope" do
    before :each do
      @excluded_album = Album.create(title: "a", ranking: 1)
      Album.create(title: "b", ranking: 2)
      Album.create(title: "c", ranking: 3)
      Album.create(title: "d", ranking: 6)
      Album.create(title: "e", ranking: 5)
      Album.create(title: "f", ranking: 4)
    end

    it "only selects 5 items" do
      expect(Album.top_5.count).to eq 5
      expect(Album.top_5).to_not include(@excluded_album)
    end

    it "orders the items from high to low ranking" do
      top_5_titles = Album.top_5.map { |album| album.title }
      correct_order = ["d", "e", "f", "c", "b"]

      expect(top_5_titles).to eq(correct_order)
    end
  end
end
