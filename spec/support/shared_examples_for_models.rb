require 'rails_helper'

RSpec.shared_examples "a collection" do
  let(:collection) { described_class.new }

  describe "model validations" do
    it "requires a name all the time" do
      expect(collection).to_not be_valid
      expect(collection.errors.keys).to include(:name)
    end
  end

  describe "best scope" do
    it "displays just 10 items with ranking in desc order" do
      collection1  = described_class.create(name: "name1", description: "description1", ranking: 1)
      collection2  = described_class.create(name: "name2", description: "description2", ranking: 2)
      collection3  = described_class.create(name: "name3", description: "description3", ranking: 3)
      collection4  = described_class.create(name: "name4", description: "description4", ranking: 4)
      collection5  = described_class.create(name: "name5", description: "description5", ranking: 5)
      collection6  = described_class.create(name: "name6", description: "description6", ranking: 6)
      collection7  = described_class.create(name: "name7", description: "description7", ranking: 7)
      collection8  = described_class.create(name: "name8", description: "description8", ranking: 8)
      collection9  = described_class.create(name: "name9", description: "description9", ranking: 9)
      collection10 = described_class.create(name: "name10", description: "description10", ranking: 10)
      collection11 = described_class.create(name: "name11", description: "description11", ranking: 11)
      collection12 = described_class.create(name: "name12", description: "description12", ranking: 12)

      desc_order = [collection12, collection11, collection10, collection9, collection8, collection7, collection6, collection5, collection4, collection3]
      expect(described_class.best).to eq desc_order
      expect(described_class.best.count).to eq 10
    end
  end
end
