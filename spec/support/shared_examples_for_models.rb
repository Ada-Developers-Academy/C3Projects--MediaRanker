require 'rails_helper'

RSpec.shared_examples "an object" do
  let(:object) { described_class.new }

  before :each do
    object = described_class
  end

  it "requires a name all the time" do

    expect(object).to_not be_valid
    expect(object.errors.keys).to include(:name)
  end

  it "requires a rank all the time" do

    expect(object).to_not be_valid
    expect(object.errors.keys).to include(:rank)
  end

  context "validating rank" do
    it "requires rank to be an integer" do
      object = described_class.new(name: "Whatev", rank: "hi")

      expect(object).to_not be_valid
      expect(object.errors.keys).to include(:rank)
    end

    it "requires rank to be less than 200" do
      object = described_class.new(name: "Lovely", rank: 250)

      expect(object).to_not be_valid
      expect(object.errors.keys).to include(:rank)
    end
  end
end

