require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "model validations" do
    it "requires a title, all the time" do
      medium = Album.new

      expect(medium).to_not be_valid
      expect(medium.errors.keys).to include(:title)
    end

    context "validating rank" do
      ["pork", 3.14, -1].each do |invalid_rank|
        it "doesn't validate #{invalid_rank} for rank" do
          medium = Album.new(rank: invalid_rank)

          expect(medium).to_not be_valid
          expect(medium.errors.keys).to include(:rank)
        end
      end
    end
  end

  describe "ranked scope" do
    # positive test
    it "orders the albums descending by rank" do
      album1 = Album.create(title: 'a', rank: 1)
      album2 = Album.create(title: 'b', rank: 2)
      album3 = Album.create(title: 'c', rank: 3)

      expect(Album.ranked.first).to eq album3
    end

    # negative test
    it "does not order the albums by id" do
      album1 = Album.create(title: 'a', rank: 1)
      album2 = Album.create(title: 'b', rank: 2)
      album3 = Album.create(title: 'c', rank: 3)

      expect(Album.ranked.first).to_not eq Album.find(1)
    end
  end
end
