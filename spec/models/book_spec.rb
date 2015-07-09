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

  describe "ranked scope" do
    # positive test
    it "orders the books descending by rank" do
      medium1 = Book.create(title: 'a', rank: 1)
      medium2 = Book.create(title: 'b', rank: 2)
      medium3 = Book.create(title: 'c', rank: 3)

      expect(Book.ranked.first).to eq medium3
    end

    # negative test
    it "does not order the books by id" do
      medium1 = Book.create(title: 'a', rank: 1)
      medium2 = Book.create(title: 'b', rank: 2)
      medium3 = Book.create(title: 'c', rank: 3)

      expect(Book.ranked.first).to_not eq Book.find(1)
    end
  end

  describe "top_ranked scope" do
    before :each do
      @medium1 = Book.create(title: 'a', rank: 1)
      @medium2 = Book.create(title: 'b', rank: 2)
      @medium3 = Book.create(title: 'c', rank: 3)
      @medium4 = Book.create(title: 'd', rank: 4)
      @medium5 = Book.create(title: 'e', rank: 5)
      @medium6 = Book.create(title: 'f', rank: 6)
      @medium7 = Book.create(title: 'g', rank: 7)
      @medium8 = Book.create(title: 'h', rank: 8)
      @medium9 = Book.create(title: 'i', rank: 9)
      @medium10 = Book.create(title: 'j', rank: 10)
      @medium11 = Book.create(title: 'k', rank: 11)
      @medium12 = Book.create(title: 'l', rank: 12)
    end

    # positive test
    it "orders the books descending by rank" do
      expect(Book.top_ranked.first).to eq @medium12
    end

    it "only has 10 elements" do
      expect(Book.top_ranked.count).to eq 10
    end

    # negative test
    it "does not order the books by id" do
      expect(Book.top_ranked.first).to_not eq Book.find(1)
    end

    it "does not include the lowest ranking books" do
      expect(Book.top_ranked).to_not include @medium1
    end
  end
end
