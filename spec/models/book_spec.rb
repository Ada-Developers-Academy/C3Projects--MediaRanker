require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "model validations" do
    it "requires a title" do
      book = Book.new
      expect(book).to_not be_valid
      expect(book.errors.keys).to include(:title)
    end

    it "requires an author" do
      book = Book.new
      expect(book).to_not be_valid
      expect(book.errors.keys).to include(:author)
    end

    it "has a numerical ranking starting at 1" do
      book = Book.new(title: "a title", author: "sam-i-am")
      expect(book.ranking).to eq(1)
    end

    context "error messages" do
      before(:each) do
          @book = Book.new(
            title: "some title",
            author: "a writer",
            description: "something about something"
            )
      end

      it "gives an error message for updates to blank title and author" do
        @book.update(title: '', author: '')
        expect(@book.errors.keys).to include(:title, :author)
      end

    end

  end
end
