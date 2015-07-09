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

  describe ":best scope" do
    before :each do
      @book4 = Book.create(name: "a book", vote: 8)
      @book1 = Book.create(name: "b book", vote: 4)
      @book3 = Book.create(name: "c book", vote: 19)
      @book2 = Book.create(name: "d book", vote: 38)
    end

    it "sorts the books in descending order by # of votes" do
      correct_order = [@book2, @book3, @book4, @book1]
      expect(Book.best(4)).to eq correct_order
    end
  end
end
