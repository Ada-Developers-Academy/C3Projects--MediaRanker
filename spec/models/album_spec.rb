require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "model validations" do

    before :each do
      @album = Album.new
      @album.save
    end

    it "requires a name all the time" do
      expect(@album.errors.keys).to include(:name)
    end

    it "requires a rank all the time" do
      expect(@album.errors.keys).to include(:rank)
    end
  end

  context "validating rank" do
    it "requires rank to be an integer" do
      @album = Album.new(name: "Lovely", rank: "hi" )

      @album.save

      expect(@album.errors.keys).to include(:rank)
    end
    it "requires rank to be less than 200" do
      @album = Album.new(name: "Lovely", rank: 250)

      @album.save

      expect(@album.errors.keys).to include(:rank)
    end
  end
end

