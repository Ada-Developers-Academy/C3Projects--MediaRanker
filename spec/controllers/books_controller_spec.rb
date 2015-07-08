require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET #show" do
    it "locates the correct Book" do
      book1 = Book.new(id: 1, title: "a title")
      book1.save
      book2 = Book.new(id: 2, title: "b title")
      book2.save
      params = { id: 2 }

      expect(Book.find(params[:id]).title).to eq("b title")
    end

    it "renders the :show view" do
      book = Book.new(id: 1, title: "a title")
      book.save
      get :show, id: 1

      expect(response).to render_template("show")
    end
  end

  describe "PUT #update" do
    before :each do
      @book1 = Book.new(id: 1, title: "a title")
      @book1.save
      @book2 = Book.new(id: 2, title: "b title")
      @book2.save
      Book.new(id: 3, title: "c title").save

      @params = { book: { title: "The First Bad Man", author: "Miranda July", description: "" }, id: "2" }
    end

    it "locates the correct Book" do
      params = { id: 1 }
      expect(Book.find(params[:id]).title).to eq("a title")
    end

    it "updates and saves the new information" do
      original_title       = @book2.title
      original_author      = @book2.author
      original_description = @book2.description
      put :update, @params
      @book2.reload

      expect(@book2.title).to_not       eq original_title
      expect(@book2.author).to_not      eq original_author
      expect(@book2.description).to_not eq original_description
    end

    it "doesn't create a new object" do
      original_count = Book.all.count
      put :update, @params

      expect(original_count).to eq Book.all.count
    end

    it "redirects to the movie's :show view" do
      put :update, @params
      expect(subject).to redirect_to(book_path(@book2))
    end
  end
end
