RSpec.shared_examples 'a MediaModel' do
  describe "model validations" do
    let(:medium) { described_class.new }

    it "requires a title all the time" do
      expect(medium).to_not be_valid
      expect(medium.errors.keys).to include(:title)
    end
  end

  describe "scope rank_order" do
    before :each do
      @medium1 = described_class.create(title: "HPCOS", description: "blah", rank: 3)
      @medium2 = described_class.create(title: "HPGOF", description: "dragons!", rank: 7)
    end

    it "sorts the database in descending rank order" do
      media = described_class.all

      correct_order = [@medium2, @medium1]
      expect(media.rank_order).to eq correct_order
    end

  end
end
