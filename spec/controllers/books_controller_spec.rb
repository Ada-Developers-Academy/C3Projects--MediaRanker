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
end
