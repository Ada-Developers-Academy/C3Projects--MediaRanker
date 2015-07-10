require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET index" do

    it "routes GET /books to books#index" do
      expect(get: '/books').to route_to('books#index')
    end

    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "generates /books from books_path" do
      expect(books_path).to eq('/books')
    end
  end

  describe "you can interact with a specific book" do
    before :each do
      @book = Book.create(name: "name_thing")
    end

    it "renders the #show view" do
      get :show, id: @book
      expect(response).to render_template("show")
    end

    it "renders the #new view" do
      get :new, id: @book
      expect(response).to render_template("new")
    end

    it "renders the #edit view" do
      get :edit, id: @book
      expect(response).to render_template("edit")
    end

    it "increases the rank when you upvote" do
      patch :upvote, id: @book
      @book.reload
      expect(@book.rank).to eq(1)
    end

    it "deletes a given book" do
      delete :destroy, id: @book
      expect(Book.count).to eq(0)
    end
  end

  describe "makes new books" do
    let(:valid_book) do {
      book: { name: "name1"}
    }
    end

    it "creates a new Book" do
      post :create, valid_book
      expect(Book.count).to eq(1)
    end

    it "redirects to the book show page" do
      post :create, valid_book
      expect(response).to redirect_to(book_path(assigns(:media)))
    end
  end

  describe "books can be edited" do
    let(:book) {Book.create(name: "name1", rank: 20)}

    it "updates an book with valid params" do
      post :update, id: book, book: {name: "Edited name", rank: 20}
      book.reload
      expect(book.name).to eq("Edited name")
    end

    it "redirects to the book show page" do
      post :update, id: book, book: {name: "Edited name", rank: 20}
      expect(response).to redirect_to(book_path(assigns(:media)))
    end
  end
end
