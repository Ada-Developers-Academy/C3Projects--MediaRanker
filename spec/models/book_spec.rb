require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "model validations" do
    it "requires a name" do
      book = Book.new

      expect(book).to_not be_valid
      expect(book.errors.keys).to include(:name)
    end
  end

  describe "top scope" do
    before :each do
      @book1 = Book.create(name: 'whatever', author: 'some chick', description: 'whatever desc', ranking: 3)
      @book2 = Book.create(name: 'whatever', author: 'some dude', description: 'description', ranking: 1)
      @book3 = Book.create(name: 'whatevz',  author: 'some chick', description: 'descrip', ranking: 2)
      @book4 = Book.create(name: 'whatevah', author: 'some dude', description: 'descrip', ranking: 4)
    end

    it "orders books according to ranking, highest to lowest" do
      top_books = [@book4, @book1, @book3]
      expect(Book.top(3)).to eq(top_books)
    end

    it "only displays given number of books" do
      expect(Book.top(3).count).to eq 3
    end
  end
end
