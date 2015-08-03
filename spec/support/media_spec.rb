require "spec_helper"

RSpec.shared_examples "a media" do

  describe "model validations" do
    let(:media) { described_class.new }

    context "validating name" do
      it "requires a name" do
        expect(media).to_not be_valid
        expect(media.errors.keys).to include(:name)
      end
    end

    context "rank validating" do

      it "assigns a rank" do
        expect(media).to_not be_valid
        expect(media.errors.keys).to include(:rank)
      end

      ["one", 0.0, 4.5, nil].each do |invalid_rank|
        it "requires rank to be an integer" do
          invalid_media = media
          invalid_media.attributes = {name: "Test", rank: invalid_rank}

          expect(invalid_media).to_not be_valid
          expect(invalid_media.errors.keys).to include(:rank)
        end
      end

    end
  end

  describe "scope validations: best_first" do
    # let(:excluded_media) { described_class.new(name: "Test", rank: 0) }
    # let(:included_media) { described_class.new(name: "Test", rank: 0) }

    before :each do
      ranks = [2, 1, 3, 3, 4, 5, 0, 100, 50, 101, 24, 35, 0, 0, 40, -1, 51, -20]
      ranks.each do |rank|
        described_class.create(name: "Test #{rank}", rank: rank)
      end
    end

    it "ranks by highest number first" do
      expect(described_class.best_first(10).first).to eq(described_class.find_by(rank: 101))
    end

    it "includes the highest ranked movies (designated by total argument)" do
      included_media = described_class.create(name: "Test", rank: 4)

      expect(described_class.best_first(10).count).to eq 10
      expect(described_class.best_first(10)).to include(included_media)
    end

    it "excludes the lowest ranked movies (designated by total argument)" do
      excluded_media = described_class.create(name: "Test", rank: 0)

      expect(described_class.best_first(10)).to_not include(excluded_media)
    end

  end

  describe "scope validations: best_first_all" do

    before :each do
      ranks = [2, 1, 3, 3, 4, 5, 0, 100, 50, 101, 24, 35, 0, 0, 40, -1, 51, -20]
      ranks.each do |rank|
        described_class.create(name: "Test #{rank}", rank: rank)
      end
    end

    it "ranks by highest number first" do
      expect(described_class.best_first_all.first).to eq(described_class.find_by(rank: 101))
    end

  end

end
