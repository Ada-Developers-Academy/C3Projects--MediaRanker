require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders index template" do
      get :index

      expect(response).to render_template("index")
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the :new template" do
      get :new

      expect(subject).to render_template("new")
    end

    # test which model it's creating a new form for
    it "creates a new book" do
      get :new

      expect(assigns(:book)).to be_a_new(Book)
    end
  end

  describe "POST #create" do
    # positive test - book params are valid
    context "valid book params" do
      let(:book_params) do
        { book: { title: 'some book', rank: 5 } }
      end

      before(:each) do
        post :create, book_params
      end

      it "creates an Book record" do
        expect(Book.count).to eq 1
      end

      it "redirect to the book show page" do
        expect(subject).to redirect_to(book_path(assigns(:book)))
      end
    end

    # negative test - book params are invalid
    context "invalid book params" do
      let(:book_params) do
        {
          book: { # missing the title key
            rank: 5
          }
        }
      end

      it "does not persist invalid records" do
        post :create, book_params
        expect(Book.count).to eq 0
      end

      it "renders the new template" do
        post :create, book_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    let(:book) { Book.create(title: 'some title', creator: 'some creator') }
    
    before(:each) do
      get :edit, id: book
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "finds a specific book" do
      expect(assigns(:book)).to eq(book)
    end

    it "renders the :edit template" do
      expect(subject).to render_template("edit")
    end
  end

  describe "PUT #update" do
    before(:each) do
      @book = Book.create(title: 'some title', creator: 'some person')
    end

    context "valid book params" do
      before(:each) do
        post :update, id: @book, book: { title: "updated title", creator: 'some person' }
      end

      it "updates a book with valid params" do
        @book.reload
        expect(@book.title).to eq("updated title")
      end

      it "redirects to book_path" do
        expect(subject).to redirect_to(book_path(assigns(:book)))
      end
    end

    context "invalid book params" do
      before(:each) do
        post :update, id: @book, book: { title: "", creator: 'some person' }
      end

      it "does not update an item with invalid params" do
        @book.reload
        expect(@book.title).to eq("some title")
      end

      it "renders :edit template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "PUT #upvote" do

    before(:each) do
      @book = Book.create(title: 'a title', rank: 5)
      put :upvote, id: @book
    end

    it "increases rank of record by one" do
      @book.reload
      expect(@book.rank).to eq 6
    end

    it "only affects the particular record" do
      book2 = Book.create(title: 'b title', rank: 5)

      @book.reload
      book2.reload
      expect(@book.rank).to eq 6
      expect(book2.rank).to eq 5
    end

    it "redirects to the book_path" do
      expect(subject).to redirect_to(book_path(assigns(:book)))
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @book1 = Book.create(title: 'a title', creator: 'a person')
      @book2 = Book.create(title: 'b title', creator: 'b person')
      @book3 = Book.create(title: 'c title', creator: 'c person')

      delete :destroy, id: @book3
    end

    it "deletes a particular object" do
      expect(Book.all).to_not include @book3
    end

    it "redirects to the books_path" do
      expect(response).to redirect_to(books_path)
    end
  end
end
