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

    it "selects the best 5 media and puts them in descending order" do
      
    end
  end

end