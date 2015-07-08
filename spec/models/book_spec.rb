require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "model methods" do
    describe ".best" do
      before :each do
        @book1 = Book.create({ title: "Puppies Book", written_by: "Dog", votes: 10, description: "" })
        @book2 = Book.create({ title: "Kitties Book", written_by: "Cat", votes: 9, description: "" })
        @book5 = Book.create({ title: "Fishies Book", written_by: "Fish", votes: 0, description: "" })
        @book4 = Book.create({ title: "Llamas Book", written_by: "The Llama", votes: 6, description: "" })
        @book3 = Book.create({ title: "Orangutans Book", written_by: "Orangutan", votes: 7, description: "" })
        @book6 = Book.create({ title: "Elephants Book", written_by: "Elephant", votes: 0, description: "" })
      end

      context "when passed a limit of 2" do
        it "returns top 2 books" do
          expect(Book.best(2)).to include(@book1, @book2)
        end

        it "exludes other books" do
          expect(Book.best(2)).to_not include(@book3, @book4, @book5, @book6)
        end
      end
    end

    describe ".upvote" do
      let(:book){ Book.create({ title: "Puppies Book", written_by: "Dog", votes: 10, description: "" }) }

      it "increases the votes by 1" do
        Book.upvote(book)
        expect(book.votes).to eq(11)
      end
    end
  end

  describe "model validations" do
    context "when title is missing" do
      it "does not persist the record" do
        book = Book.new

        expect(book).to_not be_valid
        expect(book.errors.keys).to include(:title)
      end
    end
  end
end
