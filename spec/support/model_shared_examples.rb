require 'spec_helper'

RSpec.shared_examples "a medium model" do
  let (:medium) { described_class.new }

  describe "model validations" do
    it "requires a title" do

      expect(medium).to_not be_valid
      expect(medium.errors.keys).to include(:title)
    end
  end

  describe "best(total) scope" do
    before :each do
      @medium1 = described_class.create(title: "a", votes: 1)
      @medium2 = described_class.create(title: "b", votes: 3)
      @medium3 = described_class.create(title: "c", votes: 2)
    end

    it "includes a number of highest ranked media" do
      correct_order = [@medium2, @medium3]
      expect(described_class.best(2)).to eq correct_order
    end

    it "excludes lower ranked media" do
      expect(described_class.best(2)).to_not include(@medium1)
    end
  end

  describe "#upvote(medium)" do
    it "increases the ranking" do
      medium = described_class.create(title: "a", votes: 1)
      described_class.upvote(medium)

      expect(medium.votes).to eq 2
    end
  end
end
