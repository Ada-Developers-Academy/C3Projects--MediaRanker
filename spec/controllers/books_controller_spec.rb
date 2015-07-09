require 'rails_helper'

RSpec.describe BooksController, type: :controller do

# INDEX ACTION__________________________________________________________________

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

# SHOW ACTION___________________________________________________________________

  describe "GET #show" do
    before :each do
      @book = Book.create(book_params[:book])
      @book.ranking = 0
    end

    let(:book_params) do
      {
        book: {
          name: 'a name',
          author: 'a author',
          description: 'a description'
        }
      }
    end

    it "renders the show template" do
      get :show, id: @book.id
      expect(response).to render_template("show")
    end
  end

# NEW ACTION____________________________________________________________________

  describe "GET #new" do

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

# CREATE ACTION_________________________________________________________________

  describe "POST #create" do

    context "Valid book params" do
      before :each do
        @book = Book.new(book_params[:book])
        @book.ranking = 0
      end

      let(:book_params) do
        {
          book: {
            name: 'a name',
            author: 'a author',
            description: 'a description'
          }
        }
      end

      it "creates a book record" do
        post :create, book_params
        expect(Book.count).to eq 1
      end

      it "redirects to the book show page" do
        post :create, book_params
        expect(subject).to redirect_to(book_path(assigns(:book)))
      end

      it "a new book has a 'ranking' equil to 0 by default" do
        post :create, book_params
        expect(@book.ranking).to eq_to 0
      end
    end

    context "Invalid book params" do
      let(:book_params) do
        {
          book: {
            author: 'a author',
            description: 'a description'
          }
        }
      end

      it "does not persist invalid records" do
        post :create, book_params
        expect(Book.count).to eq 0
      end

      it "renders the :new view if the user didn't enter a name" do
        post :create, book_params
        expect(response).to render_template("new")
      end
    end
  end

# EDIT ACTION___________________________________________________________________

  describe "GET #edit" do
    before :each do
      @book = Book.create(book_params[:book])
      @book.ranking = 0
    end

    let(:book_params) do
      {
        book: {
          name: 'a name',
          author: 'a author',
          description: 'a description'
        }
      }
    end

    it "renders the edit template" do
      get :edit, id: @book.id
      expect(response).to render_template("edit")
    end
  end

# UPDATE ACTION_________________________________________________________________

  describe "PATCH #update" do
    before :each do
      @book = Book.create(book_params[:book])
    end

    let(:book_params) do
      {
        book: {
          name: 'a name',
          author: 'a author',
          description: 'a description'
        }
      }
    end

    # When NAME field in the edit form IS NOT EMPTY
    it "updates a book record and redirects to the book show page" do
      patch :update, id: @book.id, book: { name: "updated_name" }
      @book.reload
      expect(@book.name).to eq("updated_name")
      expect(subject).to redirect_to(book_path(@book.id))
    end


    # When NAME field in the edit form IS EMPTY
    it "updates a book record" do
      patch :update, id: @book.id, book: { name: nil }
      @book.reload
      expect(response).to render_template("edit")
    end
  end


# DELETE ACTION_________________________________________________________________

  describe "DELETE #destroy" do
    before :each do
      @book = Book.create(book_params[:book])
      @book.ranking = 0
    end

    let(:book_params) do
      {
        book: {
          name: 'a name',
          author: 'a author',
          description: 'a description'
        }
      }
    end

    it "deletes a book record" do
      @book.destroy
      expect(Book.count).to eq 0
    end

    it "redirects to the book show page" do
      delete :destroy, id: @book.id
      expect(response).to redirect_to(books_path)
    end
  end

# UPVOTE ACTION_________________________________________________________________

  describe "PATCH #upvote" do
    before :each do
      @book = Book.create(book_params[:book])
    end

    let(:book_params) do
      {
        book: {
          name: 'a name',
          author: 'a author',
          description: 'a description',
          ranking: 0
        }
      }
    end

    it "upvotes a book record " do
      patch :upvote, id: @book.id
      @book.reload
      expect(@book.ranking).to eq 1
    end
  end
end
