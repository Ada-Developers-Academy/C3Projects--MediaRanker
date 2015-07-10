require 'spec_helper'

RSpec.shared_examples "a medium" do
  describe "scopes" do
    before :each do
      described_class.create(title: "a title", rank: 56)
      described_class.create(title: "b title", rank: 6)
      described_class.create(title: "c title", rank: 10)
      described_class.create(title: "d title", rank: 500)
      described_class.create(title: "e title", rank: 3)
      described_class.create(title: "f title", rank: 23)

      @correct_order_top = [ 500, 56, 23, 10, 6 ]
      @order_top = []
      described_class.all.top.each do |medium|
        @order_top << medium.rank
      end

      @correct_order_all = [ 500, 56, 23, 10, 6, 3 ]
      @order_all = []
      described_class.all.rank_order.each do |medium|
        @order_all << medium.rank
      end

    end

    describe "top scope" do
      it "orders the top 5 records" do
        expect(described_class.top.count).to eq 5
        expect(@order_top).to eq @correct_order_top
      end

      it "does not include the 6th highest ranked" do
        expect(described_class.top).to_not include(described_class.where(rank: 3))
      end
    end

    describe "rank_order scope" do
      it "orders all the records" do
        expect(described_class.rank_order.count).to eq 6
        expect(@order_all).to eq @correct_order_all
      end
    end
  end

  # Testing Validations:
  describe "model validations" do
    it "requires a title" do
      medium = described_class.new

      expect(medium).to_not be_valid
      expect(medium.errors.keys).to include(:title)
    end

    context "rank validation" do
      it "requires a rank" do
        medium = described_class.new(title: "a medium")

        expect(medium).to_not be_valid
        expect(medium.errors.keys).to include(:rank)
      end

      it "rank must be an integer" do
        medium = described_class.create(title: "a medium", rank: 10)
        expect(medium.rank.class).to eq Fixnum
      end
    end
  end
end
