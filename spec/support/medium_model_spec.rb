require 'spec_helper'

RSpec.shared_examples "a medium model" do
  describe ":top_5 scope" do
    before :each do
      @excluded_album = described_class.create(title: "a", ranking: 1)
      described_class.create(title: "b", ranking: 2)
      described_class.create(title: "c", ranking: 3)
      described_class.create(title: "d", ranking: 6)
      described_class.create(title: "e", ranking: 5)
      described_class.create(title: "f", ranking: 4)
    end

    it "only selects 5 items" do
      expect(described_class.top_rank(5).count).to eq 5
      expect(described_class.top_rank(5)).to_not include(@excluded_album)
    end

    it "orders the items from high to low ranking" do
      top_5_titles = described_class.top_rank(5).map { |described_class| described_class.title }
      correct_order = ["d", "e", "f", "c", "b"]

      expect(top_5_titles).to eq(correct_order)
    end
  end
end
