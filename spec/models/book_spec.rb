require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "model validations" do
    it "requires a title, all the time" do
      medium = Book.new

      expect(medium).to_not be_valid
      expect(medium.errors.keys).to include(:title)
    end

    context "validating rank" do
      ["pork", 3.14, -1].each do |invalid_rank|
        it "doesn't validate #{invalid_rank} for rank" do
          medium = Book.new(rank: invalid_rank)

          expect(medium).to_not be_valid
          expect(medium.errors.keys).to include(:rank)
        end
      end
    end
  end
end
