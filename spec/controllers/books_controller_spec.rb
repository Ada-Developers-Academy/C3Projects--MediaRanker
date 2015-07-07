require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
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

      it "updates a Book record" do
        patch :update, book_params.name = "name"
        expect(book_params.name).to eq "name"
      end


end
