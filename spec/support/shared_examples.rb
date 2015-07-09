require 'set'

RSpec.shared_examples "a book" do
  describe "model validations" do
    it "requires a name to be present" do
      book = Book.new

      expect(book).to_not be_valid
      expect(book.errors.keys).to include(:name)
    end

    it "requires a unique name" do
      book1 = Book.create(name: "a book")
      book2 = Book.create(name: "a book")

      expect(book2).to_not be_valid
      expect(book2.errors.keys).to include(:name)
    end

    it "defaults votes to 0" do
      book = Book.create(name: "name")

      expect(book.vote).to eq 0
    end
  end
end
