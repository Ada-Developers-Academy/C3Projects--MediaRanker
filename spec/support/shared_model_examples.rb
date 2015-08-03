RSpec.shared_examples "medium" do

  describe "model validation" do
    it "requires a name and description, all the time" do
        media = described_class.new

        expect(media).to_not be_valid 
        expect(media.errors.keys).to include(:name)
        expect(media.errors.keys).to include(:description)
    end

    it "sets default rank to 0" do
      media = described_class.new

      expect(media.rank).to eq 0
    end

  end

  describe ":best scope" do
    before :each do 
      @media1 = described_class.create(name: "media1", description: "test", rank: 100)
      @media2 = described_class.create(name: "media2", description: "test", rank: 2)
      @media3 = described_class.create(name: "media3", description: "test", rank: 10)
      @media4 = described_class.create(name: "media4", description: "test", rank: 54)
      @media5 = described_class.create(name: "media5", description: "test", rank: 11)
      @media6 = described_class.create(name: "media6", description: "test", rank: 76)
    end

    it "selects the best X number of media" do
      expect(described_class.best(5).count).to eq 5
    end

    it "returns them in descending order" do      
      correct_result = [@media1, @media6, @media4, @media5, @media3]
      expect(described_class.best(5)).to eq correct_result
    end
  end
end