RSpec.shared_examples "a media model" do
  let(:collection) { described_class.new }

  describe "model validations" do
    it "requires a name" do
      expect(collection).to_not be_valid
      expect(collection.errors.keys).to include(:name)
    end

    it "sets ranking to default of 0" do
      expect(collection.ranking).to eq 0
    end
  end

  describe "top scope" do
    before :each do
      @collection1 = described_class.create(name: 'whatever', ranking: 3)
      @collection2 = described_class.create(name: 'whatever', ranking: 1)
      @collection3 = described_class.create(name: 'whatevz',  ranking: 2)
      @collection4 = described_class.create(name: 'whatevah', ranking: 4)
    end

    it "orders movies according to ranking, highest to lowest" do
      top_collection = [@collection4, @collection1, @collection3]
      expect(described_class.top(3)).to eq(top_collection)
    end

    it "only displays given number of movies" do
      expect(described_class.top(3).count).to eq 3
    end
  end

end
