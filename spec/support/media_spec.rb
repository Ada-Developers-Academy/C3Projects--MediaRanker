require "spec_helper"

RSpec.shared_examples "a media" do
  let(:media) { described_class.new }

  describe "model validations" do

    context "validating name" do
      it "requires a name" do
        expect(media).to_not be_valid
        expect(media.errors.keys).to include(:name)
      end
    end

    context "rank validating" do

      it "requires a rank" do
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

end
