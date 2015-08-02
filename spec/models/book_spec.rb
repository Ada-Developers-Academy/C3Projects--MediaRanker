require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "model validation" do
    it "requires a name" do
      book = Book.new

      expect(book).to_not be_valid
      expect(book.errors.keys).to include(:name)
    end
  end

  describe "top scope" do
    it "returns books in descending rank order" do
    book1 = Book.create(name: "Pride and Prejudice", creator: "Jane Austen", description: "Classic literature. Kelli has many many copies", rank: 50)
    book2 = Book.create(name: "1984", creator: "George Orwell", description: "Dystopian future of Big Brother", rank: 60)
    book3 = Book.create(name: "The Kite Runner", creator: "Khaled Hosseini", description: "Childhood in Kabul, friendship and kites", rank: 68)
    book4 = Book.create(name: "To Kill a Mockingbird", creator: "Harper Lee", description: "Childhood in a sleepy southern town", rank: 40)

    correct_order = [book3, book2, book1, book4]
    expect(Book.top).to eq correct_order
    end
  end

  describe "model methods" do
    let(:book) {Book.create(name: "War and Peace", rank: 10)}

    it "increments rank by 1" do
      book.add_a_vote
      expect(book.rank).to eq(11)
    end
  end

end
