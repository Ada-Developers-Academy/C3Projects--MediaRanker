require 'rails_helper'

RSpec.shared_examples "a medium" do
  # shared rspec tests are da bomb!!

  describe "model validations" do
    let(:medium) {described_class.new}

      it "requires a name, all the time" do
        # testing that it's failing b/c title is required
        expect(medium).to_not be_valid
        expect(medium.errors.keys).to include(:name)
      end
    end

    describe "scopes" do
      before(:each) do
        @thing1 = described_class.create(name: "a", rank: 1)
        @thing6 = described_class.create(name: "a", rank: 6)
        @thing4 = described_class.create(name: "a", rank: 4)
        @thing2 = described_class.create(name: "a", rank: 2)
        @thing5 = described_class.create(name: "a", rank: 5)
        @thing3 = described_class.create(name: "a", rank: 3)
      end

      context "top scope" do
        it "top retrieves the first 5 described_class from highest rank to lowest" do
        top = [@thing6, @thing5, @thing4]
        expect(described_class.top(3)).to eq(top)
        end
      end # context top

      context "by_rank scope" do

        it "sorts media from highest to lowest rank" do
          rank_order = [@thing6, @thing5, @thing4, @thing3, @thing2, @thing1]
          expect(described_class.by_rank.first).to eq(@thing6)
          expect(described_class.by_rank.last).to eq(@thing1)
          expect(described_class.by_rank).to eq(rank_order)
        end
      end # context by_rank
    end # scopes

end
