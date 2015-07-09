require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validates incoming data" do
    it "requires a name" do
      book = Book.new

      expect(book).to_not be_valid
      expect(book.errors.keys).to include(:name)
    end
  end

  describe "has top books" do
    before :each do
      @book0 = Book.create(name: "zero", rank: 0)
      book1 = Book.create(name: "one", rank: 1)
      book2 = Book.create(name: "two", rank: 2)
      book3 = Book.create(name: "three", rank: 3)

      @top_books = [book3, book2, book1]
    end


    it "lists the top three books" do
      expect(Book.top.count).to eq(3)
    end

    it "ranks the top books in order" do
      expect(Book.top).to match_array(@top_books)
    end

    it "excludes lower ranked books" do
      expect(Book.top).to_not include(@book0)
    end

  end
end
