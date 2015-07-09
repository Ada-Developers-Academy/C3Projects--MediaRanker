require 'rails_helper'

RSpec.describe Book do
  it_behaves_like "a book"
end

RSpec.describe Book, type: :model do

  describe ":best scope" do
    before :each do
      @book4 = Book.create(name: "a book", author: "author", desc: "novel desc", vote: 8)
      @book1 = Book.create(name: "b book", author: "author", desc: "novel desc", vote: 4)
      @book3 = Book.create(name: "c book", author: "author", desc: "novel desc", vote: 19)
      @book2 = Book.create(name: "d book", author: "author", desc: "novel desc", vote: 38)
    end

    it "sorts the books in descending order by # of votes" do
      correct_order = [@book2, @book3, @book4, @book1]
      expect(Book.best(4)).to eq correct_order
    end
  end
end
