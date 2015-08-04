require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  # GET specs ----------------------------------------------------------------
    describe "GET #index" do
      it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  # POST specs ---------------------------------------------------------------
    describe "POST #create" do
      context "Invalid book params" do
        let(:book_params) do
          {
            book: {
              title: "Daisy"
            }
          }
        end

        it "doesn't persist invalid records" do
          post :create, book_params
          expect(Book.count).to eq(0)
        end

        it "renders the :new view (to allow user to fix input)" do
          post :create, book_params
          expect(response).to render_template("new")
        end
      end

      context "Valid book params" do
        let(:book_params) do
          {
            book: {
              title: "bloop, it's title",
              author: "bam, an author",
              description: "voila, description"
            }
          }
        end

        it "save a new book" do
          post :create, book_params
          # expect(post :create, book: book_params).to change(Book, :count).by(1)
          expect(Book.count).to eq(1)
        end

        it "redirects to the book index page after saving" do
          post :create, book_params
          expect(response).to redirect_to(books_path)
        end
      end
   # PATCH specs --------------------------------------------------------------------
      describe "PATCH #update" do
        before(:each) do
          @book = Book.new(title: "first title", author: "first author")
          @book.save
        end

        after(:each) do
          @book.destroy
        end

        context "Invalid data for update of book" do
          it "renders the edit form for invalid input" do
            patch :update, id: @book, :book => {title: ''}
            expect(subject).to render_template("edit")
          end
        end

        context "Valid data for update of book" do
          it "redirects to book details after updating" do
            patch :update, id: @book.id, :book => {title: 'newb'}
            @book.reload
            expect(@book.title).to eq("newb")
            expect(response).to redirect_to(album_path(@book.id))
          end
        end
      end
    end
end
