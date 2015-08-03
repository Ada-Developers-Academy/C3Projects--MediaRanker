require 'rails_helper'
require 'support/shared_controller_examples'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "medium"

  describe "GET #show" do
    it "renders the show template" do
      book = create :book
      get :show, id: book.id

      expect(response).to have_http_status(200)
      expect(response).to render_template("show")
    end
  end

  describe "GET #edit" do
    it "renders the edit template" do
      book = create :book
      get :edit, id: book.id

      expect(response).to have_http_status(200)
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    # positive test - movie params are valid
    context "Valid book params" do
      let(:book_params) do
        {
          book: {
            name: 'new book',
            author: 'johnny appleseed',
            description: 'this is the description'
          }
        }
      end

      it "creates a Book record" do
        post :create, book_params
        expect(Book.count).to eq 1
      end

      it "redirects to the book index page" do
        post :create, book_params
        expect(subject).to redirect_to(books_path)
      end
    end

    # negative test - movie params are invalid
    context "Invalid book params" do
      let(:book_params) do
        {
          book: { # invalid because it's missing the :description key
            name: 'new book',
            author: 'johnny appleseed'
          }
        }
      end

      it "does not persist invalid records" do
        post :create, book_params
        expect(Book.count).to eq 0
      end

      it "renders the :new view (to allow users to fix invalid data)" do
        post :create, book_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @book = create :book, author: "johnny appleseed"
    end

    # positive test - it updates the book's attributes
    it "updates a book's attributes" do
      patch :update, id: @book.id, book: FactoryGirl.attributes_for(:book, author: "dave johnson")
      @book.reload
      expect(@book.author).to eq('dave johnson')
    end

    it "redirects to the index page" do
      patch :update, id: @book.id, book: FactoryGirl.attributes_for(:book, author: "dave johnson")
      @book.reload
      expect(response).to redirect_to(book_path(@book))
    end
  end 

  describe "DELETE #destroy" do
    it "deletes a record" do
      book = create :book
      delete :destroy, id: book.id
      expect(Book.count).to eq 0
    end
  end

end
