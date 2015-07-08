require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "model validations" do
    it "requires a name all the time" do
      movie = Movie.new

      expect(movie).to_not be_valid
      expect(movie.errors.keys).to include(:name)
    end
  end

  describe "best scope" do
    it "displays just 10 books with ranking in desc order" do
      book1  = Book.create(name: "name1", author: "author1", description: "description1", ranking: 1)
      book2  = Book.create(name: "name2", author: "author2", description: "description2", ranking: 2)
      book3  = Book.create(name: "name3", author: "author3", description: "description3", ranking: 3)
      book4  = Book.create(name: "name4", author: "author4", description: "description4", ranking: 4)
      book5  = Book.create(name: "name5", author: "author5", description: "description5", ranking: 5)
      book6  = Book.create(name: "name6", author: "author6", description: "description6", ranking: 6)
      book7  = Book.create(name: "name7", author: "author7", description: "description7", ranking: 7)
      book8  = Book.create(name: "name8", author: "author8", description: "description8", ranking: 8)
      book9  = Book.create(name: "name9", author: "author9", description: "description9", ranking: 9)
      book10 = Book.create(name: "name10", author: "author10", description: "description10", ranking: 10)
      book11 = Book.create(name: "name11", author: "author11", description: "description11", ranking: 11)
      book12 = Book.create(name: "name12", author: "author12", description: "description12", ranking: 12)

      desc_order = [book12, book11, book10, book9, book8, book7, book6, book5, book4, book3]
      expect(Book.best).to eq desc_order
      expect(Book.best.count).to eq 10
    end
  end
end
