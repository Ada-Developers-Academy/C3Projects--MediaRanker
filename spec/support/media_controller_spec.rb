require 'rails_helper'

RSpec.shared_examples "a media controller" do
  describe "GET #index" do
    it "responds successfully to an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "responds successfully to an HTTP 200 status code" do
      @media = described_class.create(
        name: "test title",
        author: "test author",
        description: "test description",
        rank: 0
      )
      get :show, :id => @media.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    it "responds successfully to an HTTP 200 status code" do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "VALID book" do
      let(:book_params) do
        {
          book: {
            name: "test title",
            author: "test author",
            description: "test description"
          }
        }
      end

      it "creates a book" do
        post :create, book_params
        expect(described_class.count).to eq 1
      end

      it "redirects to the book show page" do
        post :create, book_params
        expect(subject).to redirect_to(books_path)
      end
    end

    context "INVALID book" do
      let(:book_params) do
        {
          media: {
            author: "test author",
            description: "test description"
          }
        }
      end

      it "does not create a book" do
        post :create, book_params
        expect(described_class.count).to eq 0
      end

      it "renders the :new action to fix book" do
        post :create, book_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    it "responds successfully to an HTTP 200 status code" do
      @book = Book.create(
        name: "test title",
        author: "test author",
        description: "test description",
        rank: 0
      )
      get :edit, :id => @book.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH #update" do
    context "VALID book" do

      before :each do
        @original_book = Book.create(
          name: "test title",
          author: "test author",
          description: "test description",
          rank: 0
        )
      end

      it "updates a book" do
        patch :update, :id => @original_book.id, book: {
          name: "edited test title",
          author: "test author",
          description: "test description"
        }
        # @original_book.reload
        expect(Book.find(1).name).to eq "edited test title"
      end

      it "redirects to the book show page" do
        patch :update, :id => @original_book.id, book: {
          name: "edited test title",
          author: "test author",
          description: "test description"
        }
        expect(subject).to redirect_to(book_path(@original_book.id))
      end
    end

    context "INVALID book" do

      before :each do
        @original_book = Book.create(
          name: "test title",
          author: "test author",
          description: "test description",
          rank: 0
        )
      end

      it "does not update a book" do
        post :update, :id => @original_book.id, book: {
          name: "",
          author: "test author",
          description: "test description"
        }
        expect(Book.find(1).name).to eq "test title"
      end

      it "renders the :edit action book for the same book" do
        post :update, :id => @original_book.id, book: {
          name: "",
          author: "test author",
          description: "test description"
        }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @book = Book.create(
        name: "test title",
        author: "test author",
        description: "test description",
        rank: 0
      )
    end

    it "deletes a book" do
      delete :destroy, :id => @book.id
      expect(Book.count).to eq 0
    end

    it "redirects to the book show page" do
      delete :destroy, :id => @book.id
      expect(subject).to redirect_to(books_path)
    end
  end

  describe "PATCH #upvote" do
    before :each do
      @book = Book.create(
        name: "test title",
        author: "test author",
        description: "test description",
        rank: 0
      )
    end

    it "deletes a book" do
      delete :destroy, :id => @book.id
      expect(Book.count).to eq 0
    end

    it "redirects to the book show page" do
      delete :destroy, :id => @book.id
      expect(subject).to redirect_to(books_path)
    end
  end
end
