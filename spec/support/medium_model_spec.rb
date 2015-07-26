require 'spec_helper'

RSpec.shared_examples "a medium model" do
  describe ":top_5 scope" do
    before :each do
      @excluded_album = described_class.create(title: "a", ranking: 1)
      rankings = [2, 3, 6, 5, 4]
      count = 0

      ['b', 'c', 'd', 'e', 'f'].each do |title|
        described_class.create(title: title, ranking: rankings[count])
        count += 1
      end
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
