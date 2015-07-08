require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    let (:book_params) do 
      { 
        book: { name: "name" }
      }
    end

    it "creates a new instance of Book" do
      get :new, book_params
      expect(assigns(:book)).to be_kind_of(Book)
    end
  end

  describe "POST #create" do
    context "valid book params" do
      let(:book_params) do
        {
          book: {
            name: "title",
            author: "author",
            desc: "desc",
            vote: 2
          }
        }
      end

      it "creates a Book record" do
        post :create, book_params
        expect(Book.count).to eq 1
      end

      it "redirects to the Book show page" do
        post :create, book_params
        expect(subject).to redirect_to(book_path(assigns(:book)))
      end
    end

    context "invalid book params" do
      let (:book_params) do
        {
          book: { 
            author: "author",
            desc: "desc",
            vote: 2
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
      @book = Book.create(name: "name")
    end
    
    context "valid book params" do
      it "updates an existing book record" do
        patch :update, id: @book.id, book: { name: "title" }
        @book.reload
        expect(@book.name).to eq "title"
      end

      it "redirects to the Book show page" do
        patch :update, id: @book.id, book: { name: "title" }
        @book.reload
        expect(subject).to redirect_to(book_path)
      end
    end

    context "invalid book params" do
      it "does not persist invalid record updates" do
        patch :update, id: @book.id, book: { desc: "desc" }
        expect(subject).to redirect_to(book_path)
      end
    end
  end

  describe "POST #upvote" do
    before :each do 
      @book = Book.create(name: "name", vote: 0)
    end

    context "clicking upvote button" do
      it "increases the upvote count by 1" do
        post :upvote, id: @book.id
        @book.reload
        expect(@book.vote).to eq 1
      end

      it "redirects to the Book show page" do
        patch :upvote, id: @book.id
        @book.reload
        expect(subject).to redirect_to(book_path)
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do 
      @book = Book.create(name: "name")
    end

    context "clicking the delete button" do
      it "removes a record" do
        delete :destroy, id: @book.id
        expect(Book.count).to eq 0
      end

      it "redirects to the Book show page" do
        delete :destroy, id: @book.id
        expect(subject).to redirect_to(books_path)
      end
    end
  end
end
