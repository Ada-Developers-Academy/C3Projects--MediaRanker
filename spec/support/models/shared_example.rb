RSpec.shared_examples 'a MediaModel' do
  describe "model validations" do
    let(:medium) { described_class.new }

    it "requires a title all the time" do
      expect(medium).to_not be_valid
      expect(medium.errors.keys).to include(:title)
    end
  end

  describe "scope rank_order" do
    it "sorts the database in descending rank order" do
      medium1 = described_class.create(title: "HPCOS", description: "blah", rank: 3)
      medium2 = described_class.create(title: "HPGOF", description: "dragons!", rank: 7)
      media = described_class.all

      correct_order = [medium2, medium1]
      expect(media.rank_order).to eq correct_order
    end
  end

  describe "scope rank_order_top" do
    it "returns a ranked array of only the top ten media" do
      counter = 0

      12.times do
        described_class.create(title: "hello", rank: counter + 1)
        counter += 1
      end

      top_ten = described_class.rank_order_top

      expect(top_ten.count).to eq 10
      expect(top_ten.first.rank).to eq 12
      expect(top_ten.last.rank).to eq 3
    end

    it "returns a ranked array of all the media if there's less than ten items" do
      medium1 = described_class.create(title: "HPCOS", description: "blah", rank: 3)
      medium2 = described_class.create(title: "HPGOF", description: "dragons!", rank: 7)
      media = described_class.all

      correct_array = [medium2, medium1]
      expect(media.rank_order_top).to eq correct_array
    end
  end
end
