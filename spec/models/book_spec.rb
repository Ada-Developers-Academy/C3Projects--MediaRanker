require 'rails_helper'

RSpec.describe Book, type: :model do 

  describe "model validations" do
    it "requires a name, description, and author all the time" do
      book = Book.new

      expect(book).to_not be_valid
      expect(book.errors.keys).to include(:name,:description,:author)
    end
  end

  describe "best scope" do
    it "ranks all the books by vote in descending order" do
      book1= Book.create(name:'a', author:'b', description: 'c', vote:30)
      book2= Book.create(name:'a', author:'b', description: 'c', vote:3)
      book3= Book.create(name:'a', author:'b', description: 'c', vote:20)

      right_rank = [book1, book3, book2]

      expect(Book.best(3)).to eq right_rank
    end
  end
end