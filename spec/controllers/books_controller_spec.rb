require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe BooksController do
    it_behaves_like "a media controller"
  end

  describe "POST #create" do
    context "Valid book params" do
      let(:book_params) do
        {
          book: {
            name: 'book name',
            author: 'author name',
            description: 'some descrip'
          }
        }
      end

      it "creates an Book record" do
        post :create, book_params
        expect(Book.count).to eq 1
      end

      it "redirects to the Book show page" do
        post :create, book_params
        expect(subject).to redirect_to(book_path(assigns(:book)))
      end
    end

    context "Invalid params" do
      let(:book_params) do
        {
          book: {
            author: 'author name',
            description: 'some descrip'
          }
        }
      end

      it "does not persist invalid records" do
        post :create, book_params
        expect(Book.count).to eq 0
      end

      it "renders the :new view so user can fix missing data" do
        post :create, book_params
        expect(subject).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "Editing book entry" do
      let(:attr) do
        { :name => 'new name', :author => 'new author', :description => 'new description' }
      end

      before :each do
        @old_book = Book.create(name: 'old name', author: 'old author', description: 'old descrip')

        put :update, :id => @old_book.id, :book => attr
        @old_book.reload
      end

      it "replaces entry with new info" do
        expect(@old_book.name).to eq(attr[:name])
        expect(@old_book.author).to eq(attr[:author])
        expect(@old_book.description).to eq(attr[:description])
      end

      it "redirects to the Book show page" do
        expect(subject).to redirect_to(book_path(assigns(:book)))
      end
    end

    context "Clicking upvote button" do
      before :each do
        @book = Book.create(name: 'name', author: 'author', description: 'descrip')

        put :update, :id => @book.id
        @book.reload
        # this update is going through the wrong path in update's if else conditional
      end

      it "increments ranking by 1" do
        expect(@book.ranking).to eq(1)
      end

      it "redirects to the Book show page" do
        expect(subject).to redirect_to(book_path(assigns(:book)))
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes existing entry" do
      @book = Book.create(name: 'name', author: 'author', description: 'descrip')

      delete :destroy, :id => @book.id
      expect(Book.count).to eq(0)
    end
  end
end
