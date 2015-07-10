require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  describe "GET index" do
    it "renders the :index view for all Books" do
       get :index
       expect(response).to render_template("index")
    end

    it "loads all of the books into @books" do
      book1, book2 = Book.create(:name => "First Book Name"), Book.create(:name => "2nd Book Name")
      get :index
      expect(assigns(:books)).to match_array([book1, book2])
    end
  end

    describe "GET #new" do
      let (:chapter_params) do
        {
          book: { name: "New Chapter" }
        }
      end

      it "creates a new Book object" do
        get :new, chapter_params
        expect(assigns(:book)).to be_kind_of(Object)
      end
  end

  describe "POST create" do
    context "Valid book params" do
      let(:book_params) do # any name to rep the params
        {
          book: {
            name: 'Jurassic Universe',
            author: 'Spielberg',
            description: 'RAWR.',
            rank: 1
          }
        }
      end

      it "creates an Book record" do
        post :create, book_params # this calls the let
        expect(Book.count).to eq 1
      end

      it "renders to the book's show page" do
        post :create, book_params
        expect(response).to render_template("show")
      end
    end

    context "Invalid book params" do

      let(:invalid_book_params) do
        {
          book: {
            author: 'Steven',
            description: 'Tiny arms galore',
            rank: 2
          }
        }
      end

      it "does not persist invalid records" do
        post :create, invalid_book_params
        expect(Book.count).to eq 0
      end

      it "renders the :new view (to allow users to fix invalid data)" do
        post :create, invalid_book_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @book = Book.create(:name => "New Warz")
    end

    after :each do
     @book.destroy
    end


    context "successful deletion" do
      it "deletes a record" do
        delete :destroy, id: @book.id
        expect(Book.count).to eq 0
      end

      it "redirects to the book index page" do
        delete :destroy, id: @book.id
        expect(subject).to redirect_to(books_path)
      end

    end

  end
    # let(:edited_info) do
    #   { :name => 'New Book Name' }
    # end

  describe "PATCH #update" do

    before(:each) do
      @book = Book.create(name: 'Book Name')
    end

    after :each do
      @book.destroy
    end

    context "valid book params" do

      it "updates an an existing book record" do
        patch :update, id: @book.id, book: { name: "Different Book Name" }
        @book.reload
        expect(@book.name).to eq "Different Book Name"
      end

      it "redirects to the book's show page" do
        patch :update, id: @book.id, book: { name: "Different Book Name" }
        @book.reload
        expect(subject).to redirect_to(book_path)
      end
    end

    context "invalid book params" do

      it "does not persist invalid records" do
        patch :update, id: @book.id, book: { name: "" }
        expect(@book.name).to eq "Book Name"
      end

      it "renders the :edit view (to allow users to fix invalid data)" do
        patch :update, id: @book.id, book: { name: "" }
        expect(subject).to render_template("edit")
      end
    end
  end
end
