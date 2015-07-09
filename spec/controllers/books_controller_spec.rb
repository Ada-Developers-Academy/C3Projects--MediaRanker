require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET #index" do
    it "responds successfully with HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    let(:book) do
      Book.create(name: "Test Name")
    end

    it "responds successfully with HTTP 200 status code" do
      get :show, id: book

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    it "responds successfully with HTTP 200 status code" do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "valid params" do
      let(:book_params) do
        {
          book: {
            name: "Test Name",
            description: "nope"
          }
        }
      end

      it "creates a record" do
        post :create, book_params

        expect(Book.count).to eq(1)
      end

      it "redirects to #show" do
        post :create, book_params

        expect(response).to redirect_to(book_path(Book.last))
      end
    end

    context "invalid params" do
      let(:book_params) do
        {
          book: {
            # no :name, which is required,
            description: "nope"
          }
        }
      end

      it "doesn't create invalid records" do
        post :create, book_params

        expect(Book.count).to eq(0)
      end

      it "renders #new" do
        post :create, book_params

        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    let(:book) do
      Book.create(name: "Test Name")
    end

    it "responds successfully with HTTP 200 status code" do
      get :edit, id: book

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT #update" do
    let(:book) do
      Book.create(name: "Test Name")
    end

    it "updates a record" do
      put :update, id: book, book: { name: "Changed Name" }
      book.reload

      expect(book.name).to eq("Changed Name")
    end

    it "on successful update, redirects to #show" do
      post :update, id: book, book: { description: "Changed Name" }

      expect(response).to redirect_to(book_path(book))
    end

    it "on unsuccessful update, renders #edit" do
      post :update, id: book, book: { name: nil }

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("edit")
    end
  end

  describe "DELETE #destroy" do
    let(:book) do
      Book.create(name: "Test Name")
    end

    it "destroys a record" do
      delete :destroy, id: book

      expect(Book.count).to eq(0)
    end

    it "redirects to #index" do
      delete :destroy, id: book

      expect(response).to redirect_to(books_path)
    end
  end

  describe "POST #upvote" do
    let(:book) do
      Book.create(name: "Test Name")
    end

    it "defaults :rank to 0 on record creation" do
      expect(book.rank).to eq(0)
    end

    it "increments :rank by 1" do
      post :upvote, id: book
      book.reload

      expect(book.rank).to eq(1)
    end

    it "increments :rank multiple times" do
      10.times do
        post :upvote, id: book
      end
      book.reload

      expect(book.rank).to eq(10)
    end

    it "redirects to #show" do
      post :upvote, id: book

      expect(response).to redirect_to(book_path(book))
    end
  end
end
