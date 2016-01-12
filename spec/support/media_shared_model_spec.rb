RSpec.shared_examples "a media model" do
  let(:media) { described_class.new }

  describe "model validations" do
    it "requires a name" do
      expect(media).to_not be_valid
      expect(media.errors.keys).to include(:name)
    end

    it "sets ranking to default of 0" do
      expect(media.ranking).to eq 0
    end
  end

  describe "top scope" do
    before :each do
      @media1 = described_class.create(name: 'whatever', ranking: 3)
      @media2 = described_class.create(name: 'whatever', ranking: 1)
      @media3 = described_class.create(name: 'whatevz',  ranking: 2)
      @media4 = described_class.create(name: 'whatevah', ranking: 4)
    end

    it "orders media according to ranking, highest to lowest" do
      top_media = [@media4, @media1, @media3]
      expect(described_class.top(3)).to eq(top_media)
    end

    it "only displays given number of movies" do
      expect(described_class.top(3).count).to eq 3
    end
  end

  describe "ranking_order scope" do
    before :each do
      @media1 = described_class.create(name: 'whatever', ranking: 1)
      @media2 = described_class.create(name: 'whatever', ranking: 2)
      @media3 = described_class.create(name: 'whatevz',  ranking: 3)
      @media4 = described_class.create(name: 'whatevah', ranking: 4)
    end

    it "orders all media in model according to ranking, highest to lowest" do
      ranked_media = [@media4, @media3, @media2, @media1]

      expect(described_class.ranking_order). to eq(ranked_media)
    end
  end

end
