require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  describe "GET #index" do
    it "renders the index template" do
      get :index

      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    let(:book_params) do
      {
        book: {
          name: 'new book',
          author: 'johnny appleseed',
          description: 'this is the description'
        }
      }
    end

    before :each do
      @book = Book.create(book_params[:book])
    end

    it "renders the show template" do
      get :show, id: @book.id

      expect(response).to have_http_status(200)
      expect(response).to render_template("show")
    end
  end

  describe "GET #edit" do
    let(:book_params) do
      {
        book: {
          name: 'new book',
          author: 'johnny appleseed',
          description: 'this is the description'
        }
      }
    end

    before :each do
      @book = Book.create(book_params[:book])
    end

    it "renders the edit template" do
      get :edit, id: @book.id

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
    let(:book_params) do
      {
        book: {
          name: 'new book',
          author: 'johnny appleseed',
          description: 'my description'
        }
      }
    end

    let(:new_book_params) do
      {
        book: {
          name: 'new movie',
          author: 'dave johnson',
          description: 'my description'
        }
      }
    end

    before :each do
      @book = Book.create(book_params[:book])
    end

    # positive test - it updates the book's attributes
    it "updates a book's attributes" do
      patch :update, id: @book.id, book: new_book_params[:book]
      @book.reload
      expect(@book.author).to eq('dave johnson')
    end

    it "redirects to the index page" do
      patch :update, id: @book.id, book: new_book_params[:book]
      @book.reload
      expect(response).to redirect_to(book_path(@book))
    end
  end 

  describe "DELETE #destroy" do
    let(:book_params) do
      {
        book: {
          name: 'new book',
          author: 'johnny appleseed',
          description: 'my description'
        }
      }
    end

    before :each do
      @book = Book.create(book_params[:book])
    end

    it "deletes a record" do
      delete :destroy, id: @book.id
      expect(Book.count).to eq 0
    end
  end

end
