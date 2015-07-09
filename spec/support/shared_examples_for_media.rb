require 'spec_helper'

RSpec.shared_examples "a medium" do
  let(:medium) { described_class.new }

  describe "model validations" do
    it "requires a title, all the time" do
      expect(medium).to_not be_valid
      expect(medium.errors.keys).to include(:title)
    end

    context "validating rank" do
      ["pork", 3.14, -1].each do |invalid_rank|
        it "doesn't validate #{invalid_rank} for rank" do
          medium = described_class.new(rank: invalid_rank)

          expect(medium).to_not be_valid
          expect(medium.errors.keys).to include(:rank)
        end
      end
    end

    context "creator and description are optional" do
      it "allows creation of a medium without a creator" do
        medium = described_class.new(title: 'a title', description: 'a description', rank: 5)

        expect(medium).to be_valid
        expect(medium.errors.keys).to_not include(:creator)
      end

      it "allows creation of a medium without a description" do
        medium = described_class.new(title: 'a title', creator: 'a creator', rank: 5)

        expect(medium).to be_valid
        expect(medium.errors.keys).to_not include(:description)
      end
    end
  end

  describe "db defaults" do
    it "rank can be assigned explicitly" do
      medium = described_class.new(title: 'a title', rank: 5)

      expect(medium.rank).to eq 5
    end

    it "rank defaults to 0 if no value entered" do
      medium = described_class.new(title: 'a title')

      expect(medium.rank).to eq 0
    end
  end

  describe "ranked scope" do
    # positive test
    it "orders the mediums descending by rank" do
      medium1 = described_class.create(title: 'a', rank: 1)
      medium2 = described_class.create(title: 'b', rank: 2)
      medium3 = described_class.create(title: 'c', rank: 3)

      expect(described_class.ranked.first).to eq medium3
    end

    # negative test
    it "does not order the mediums by id" do
      medium1 = described_class.create(title: 'a', rank: 1)
      medium2 = described_class.create(title: 'b', rank: 2)
      medium3 = described_class.create(title: 'c', rank: 3)

      expect(described_class.ranked.first).to_not eq described_class.find(1)
    end
  end

  describe "top_ranked scope" do
    before :each do
      @medium1 = described_class.create(title: 'a', rank: 1)
      @medium2 = described_class.create(title: 'b', rank: 2)
      @medium3 = described_class.create(title: 'c', rank: 3)
      @medium4 = described_class.create(title: 'd', rank: 4)
      @medium5 = described_class.create(title: 'e', rank: 5)
      @medium6 = described_class.create(title: 'f', rank: 6)
      @medium7 = described_class.create(title: 'g', rank: 7)
      @medium8 = described_class.create(title: 'h', rank: 8)
      @medium9 = described_class.create(title: 'i', rank: 9)
      @medium10 = described_class.create(title: 'j', rank: 10)
      @medium11 = described_class.create(title: 'k', rank: 11)
      @medium12 = described_class.create(title: 'l', rank: 12)
    end

    # positive test
    it "orders the mediums descending by rank" do
      expect(described_class.top_ranked.first).to eq @medium12
    end

    it "only has 10 elements" do
      expect(described_class.top_ranked.count).to eq 10
    end

    # negative test
    it "does not order the mediums by id" do
      expect(described_class.top_ranked.first).to_not eq described_class.find(1)
    end

    it "does not include the lowest ranking mediums" do
      expect(described_class.top_ranked).to_not include @medium1
    end
  end

  describe "add_vote method" do
    it "increases rank of an medium" do
      medium = described_class.create(title: 'a', rank: 5)
      medium.add_vote

      expect(medium.rank).to eq 6
    end
  end
end
