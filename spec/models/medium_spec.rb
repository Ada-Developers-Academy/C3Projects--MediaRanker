require 'rails_helper'

RSpec.describe Medium, type: :model do

  before(:each) do
    @bad_medium = Medium.new
  end

  describe "database structure" do

    it "ensures that a new medium has a default ranking of zero" do
      expect(@bad_medium.ranking).to eq 0
    end

  end

  describe "model validations" do

    it "requires a title always" do
      expect(@bad_medium).to_not be_valid
      expect(@bad_medium.errors.keys).to include(:name)
    end

    %w(album book movie).each do |type|
      it "only recognizes valid media type #{type}" do
        good_medium = Medium.new(name: "Yay", media_type: type)
        expect(good_medium).to be_valid
      end
    end

    it "doesn't recognize invalid of media types" do
      blearg_medium = Medium.new(name: "Yay", media_type: "stage production")
      blearg_medium2 = Medium.new(name: "Yaaar")

      expect(blearg_medium).to_not be_valid
      expect(blearg_medium.errors.keys).to include(:media_type)
      expect(blearg_medium2).to_not be_valid
      expect(blearg_medium2.errors.keys).to include(:media_type)
    end


  end



  describe "on scope" do

    before :each do
      @medium = Medium.create!(ranking: 4, name: "A book", media_type: "book")
      @medium2 = Medium.create!(ranking: 1, name: "A book", media_type: "album")
      @medium3 = Medium.create!(ranking: 2, name: "A book", media_type: "movie")
    end

    it "selects only the top two media" do
      correct_order = [@medium, @medium3]
      expect(Medium.top_rank(2)).to eq correct_order
    end

    it "ranks all media based on their ranking" do
      correct_order = [@medium, @medium3, @medium2]
      expect(Medium.all_rank).to eq correct_order
    end



  end
end
