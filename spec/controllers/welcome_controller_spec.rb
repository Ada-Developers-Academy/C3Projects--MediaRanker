require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET #update" do
    context "books" do
      before :each do
        @book1 = Book.create(title: 'a', votes: 1)
        @book2 = Book.create(title: 'b', votes: 2)
        @book3 = Book.create(title: 'c', votes: 3)
      end

      it "returns the highest ranked books" do
        correct_order = [@book3, @book2]
        expect(Book.best(2)).to eq correct_order
      end

      it "does not return the highest ranked books" do
        correct_order = [@book2, @book3]
        expect(Book.best(2)).to_not eq correct_order
      end
    end

    context "books" do
      before :each do
        @movie1 = Movie.create(title: 'a', votes: 1)
        @movie2 = Movie.create(title: 'b', votes: 2)
        @movie3 = Movie.create(title: 'c', votes: 3)
      end

      it "returns the highest ranked movies" do
        correct_order = [@movie3, @movie2]
        expect(Movie.best(2)).to eq correct_order
      end

      it "does not return the highest ranked movies" do
        correct_order = [@movie2, @movie3]
        expect(Movie.best(2)).to_not eq correct_order
      end
    end

    context "albums" do
      before :each do
        @album1 = Album.create(title: 'a', votes: 1)
        @album2 = Album.create(title: 'b', votes: 2)
        @album3 = Album.create(title: 'c', votes: 3)
      end

      it "returns the highest ranked albums" do
        correct_order = [@album3, @album2]
        expect(Album.best(2)).to eq correct_order
      end

      it "does not return the highest ranked albums" do
        correct_order = [@album2, @album3]
        expect(Album.best(2)).to_not eq correct_order
      end
    end
  end
end
