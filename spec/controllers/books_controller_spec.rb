require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  context "When newing up a Book" do
    before(:each) do
      get :new
    end

    it "creates a new book" do
      expect(assigns(:book)).to be_a_new(Book)
    end
  end

  describe "GET #index" do
    it "assigns to @books" do
      book = Book.create(name: "Girl with the Dragon Tattoo", rank: 89)
      get :index
      expect(assigns(:books)).to eq([book])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "PATCH #update" do
    it "updates the book params" do
      book = Book.create(name: "Howdy", rank: 8)

      book.update(name: "Howdy Y'all")

      expect(book.name).to eq("Howdy Y'all")
    end
  end

  describe "PATCH #upvote" do
    it "increases the book rank by 1" do
      book = Book.create(name: "Tragic Kingdom", rank: 99)

      patch :upvote, id: book.id

      book.reload

      expect(book.rank).to eq(100)
    end
  end

end
