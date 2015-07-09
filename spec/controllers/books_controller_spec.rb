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
    # positive test - book params are valid
    context "valid book params" do
      let(:book_params) do
        {
          book: {
            title: 'some book', 
            rank: 5
          }
        }
      end

      it "creates an Book record" do
        post :create, book_params
        expect(Book.count).to eq 1
      end

      it "redirect to the book show page" do
        post :create, book_params
        expect(subject).to redirect_to(book_path(assigns(:medium)))
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
end
