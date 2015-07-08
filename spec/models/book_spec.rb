require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "model validations" do

    before :each do
      @book = Book.new
      @book.save
    end

    it "requires a name all the time" do
      expect(@book.errors.keys).to include(:name)
    end

    it "requires a rank all the time" do
      expect(@book.errors.keys).to include(:rank)
    end
  end

  context "validating rank" do
    it "requires rank to be an integer" do
      @book = Book.new(name: "Lovely", rank: "hi" )

      @book.save

      expect(@book.errors.keys).to include(:rank)
    end

    it "requires rank to be less than 200" do
      @book = Book.new(name: "Lovely", rank: 250)

      @book.save

      expect(@book.errors.keys).to include(:rank)
    end
  end
end
