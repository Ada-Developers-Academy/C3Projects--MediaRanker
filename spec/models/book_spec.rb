require 'rails_helper'

RSpec.describe Book, type: :model do

  describe "model validations" do
    it "requires the presence of a name" do
      book = Book.new
      expect(book).to_not be_valid
      expect(book.errors.keys).to include(:name)
    end

    it "only books with names will be recognized" do
      book = Book.new(name: "Nameless Book")
      expect(book).to be_valid
      expect(book.errors.keys).to_not include(:name)
    end
  end

  describe "scopes" do

    context "ordered scope for books#index page" do

      it "orders the list of all books in descending order" do
        book1 = Book.create(:name => "First Book Name", :rank => 4)
        book2 = Book.create(:name => "2nd Book Name", :rank => 1 )
        book3 = Book.create(:name => "3rd Book Name", :rank => 2 )
        ordered_books = [book1, book3, book2]
        expect(Book.ordered).to eq ordered_books
      end
    end

    context "top scope for books in the welcome#index page" do

      it "orders the list of all books on the index page in descending order" do
        book1 = Book.create(:name => "First Book Name", :rank => 4)
        book2 = Book.create(:name => "2nd Book Name", :rank => 1 )
        book3 = Book.create(:name => "3rd Book Name", :rank => 2 )
        ordered_books = [book1, book3, book2]
        expect(Book.top).to eq ordered_books
      end
    end
  end
end
