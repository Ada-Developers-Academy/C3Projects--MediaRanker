require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe BooksController do
    it_behaves_like "a media"
  end

  describe "POST create" do
    context "valid params" do
      let (:params) do {book: {id: 2, name: "a name", creator: "someone", description: "whatever" }}
      end

      it "creates a new Book record" do
        post :create, params

        expect(Book.count).to eq 1
      end

      it "redirects to the book show page" do
        post :create, params

        expect(subject).to redirect_to(book_path(assigns(:book)))
      end
    end

    context "invalid params" do
      let (:params) do {book: {id: 2, creator: "a person", description: "something" }}
      end

      it "does not persist into the database" do
        post :create, params

        expect(Book.count).to eq 0
      end

      it "renders the new action" do
        post :create, params

        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH update" do
    before :each do
      @book1 = Book.new(id: 1, name: "any old name")
      @book1.save
    end

    it "updates an existing record" do
        original_name = @book1.name
        patch :update, id: @book1.id, book: { id: 1, name: "A new name" }
        @book1.reload


        expect(@book1.name).to_not eq original_name
    end
  end
end
