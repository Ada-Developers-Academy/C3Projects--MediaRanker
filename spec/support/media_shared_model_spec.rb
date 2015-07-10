require 'spec_helper'

RSpec.shared_examples "a medium" do
  let (:medium) { described_class.new }

  describe "model validations" do
  it "requires a name" do

    expect(medium).to_not be_valid
    expect(medium.errors.keys).to include(:name)
    end
  end

  describe "ranking scope" do

    before :each do
      @medium1 = described_class.create(id: 1, name: "Cool medium", creator: "some person", description: "cool", rank: 5)
      @medium2 = described_class.create(name: "Rad medium", creator: "some person", description: "rad", rank: 11)
      @medium3 = described_class.create(name: "Neat medium", creator: "some person", description: "neat", rank: 3)
    end

    it "returns n number of media based on argument" do

      expect(described_class.ranking(2).count).to eq 2
    end

    it "returns an ordered list of top ranked media" do

      correct_order = [@medium2, @medium1, @medium3]
      expect(described_class.ranking(3)).to eq correct_order
    end


    it "includes only the top ranked movie when total equals 1" do
      expect(described_class.ranking(1).count).to eq 1
      expect(described_class.ranking(1)).to_not include (@medium1)
    end
  end

  describe "add_vote" do
    before :each do
      @medium1 = described_class.create(name: "Cool Movie", creator: "some person", description: "cool", rank: 5)
    end

    it "adds 1 to an album rank" do
      @medium1.add_vote

      expect(@medium1.rank).to eq 6
    end
  end
end


