RSpec.shared_examples "medium" do 
  describe "model validations" do
    it "requires a name to be present" do
      media = described_class.new

      expect(media).to_not be_valid
      expect(media.errors.keys).to include(:name)
    end

    it "requires a unique name" do
      media1 = described_class.create(name: "a media")
      media2 = described_class.create(name: "a media")

      expect(media2).to_not be_valid
      expect(media2.errors.keys).to include(:name)
    end

    it "defaults votes to 0" do
      media = described_class.create(name: "name")

      expect(media.vote).to eq 0
    end
  end

  describe ":best scope" do
    before :each do
      @media4 = described_class.create(name: "a media", vote: 8)
      @media1 = described_class.create(name: "b media", vote: 4)
      @media3 = described_class.create(name: "c media", vote: 19)
      @media2 = described_class.create(name: "d media", vote: 38)
    end

    it "sorts the medias in descending order by # of votes" do
      correct_order = [@media2, @media3, @media4, @media1]
      expect(described_class.best(4)).to eq correct_order
    end
  end
end
