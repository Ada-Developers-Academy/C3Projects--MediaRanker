require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "model validations" do
    it "requires a title, all the time" do
      book = Book.new

      expect(book).to_not be_valid
      expect(book.errors.keys).to include(:title)
    end
  end

  describe "best(total) scope" do
    before :each do
      @book1 = Book.create(title: "a", votes: 1)
      @book2 = Book.create(title: "b", votes: 3)
      @book3 = Book.create(title: "c", votes: 2)
    end

    # positive test - includes a number of highest ranked books
    it "includes a number of highest ranked books" do
      correct_order = [@book2, @book3]
      expect(Book.best(2)).to eq correct_order
    end

    # negative test - excludes lower ranked books
    it "excludes lower ranked books" do
      expect(Book.best(2)).to_not include(@book1)
    end
  end

  describe "#upvote(book)" do
    it "increases the ranking" do
      book = Book.create(title: "a", votes: 1)
      Book.upvote(book)

      expect(book.votes).to eq 2
    end
  end
end
