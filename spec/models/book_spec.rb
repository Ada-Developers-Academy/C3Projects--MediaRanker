require 'rails_helper'

RSpec.describe Book, type: :model do
describe "model validations" do
  it "requires a name" do
    book = Book.new

    expect(book).to_not be_valid
    expect(book.errors.keys).to include(:name)
    end
  end


  describe "ranking scope" do

    before :each do
      @book1 = Book.create(name: "Cool Book", creator: "some person", description: "cool", rank: 5)
      @book2 = Book.create(name: "Rad Book", creator: "some person", description: "rad", rank: 11)
      @book3 = Book.create(name: "Neat Book", creator: "some person", description: "neat", rank: 3)
    end

    it "returns n number of books based on argument" do

      correct_order = [@book2, @book1]
      expect(Book.ranking(2)).to eq correct_order
    end

    it "returns an ordered list of top ranked books" do

      correct_order = [@book2, @book1, @book3]
      expect(Book.ranking(3)).to eq correct_order
    end

    it "includes only the top ranked book when total equals 1" do
      expect(Book.ranking(1).count).to eq 1
      expect(Book.ranking(1)).to_not include (@book1)
    end
  end

  describe "add_vote" do
    before :each do
      @book1 = Book.create(name: "Cool Book", creator: "some person", description: "cool", rank: 5)
    end
    it "adds 1 to an Book rank" do
      @book1.add_vote

      expect(@book1.rank).to eq 6
    end
  end


end
