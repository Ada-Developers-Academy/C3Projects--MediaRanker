require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    context "books" do
      before :each do
        @book1 = Book.create(title: 'a', votes: 1)
        @book2 = Book.create(title: 'b', votes: 2)
        @book3 = Book.create(title: 'c', votes: 3)
        @book4 = Book.create(title: 'd', votes: 4)
        @book5 = Book.create(title: 'e', votes: 5)
        @book6 = Book.create(title: 'f', votes: 6)

      end

      it "returns the correct order of highest ranked books" do
        get :index
        correct_order = [@book6, @book5, @book4, @book3, @book2]
        expect(assigns(:books)).to eq correct_order
      end

      it "returns the correct number of highest ranked books" do
        get :index
        expect(assigns(:books).count).to eq 5
      end

      it "does not return the correct order of highest ranked books" do
        correct_order = [@book2, @book3, @book4, @book5, @book6]
        expect(assigns(:book)).to_not eq correct_order
      end

      it "does not return the correct number of highest ranked books" do
        get :index
        expect(assigns(:books).count).to_not eq 4
      end
    end

    context "movies" do
      before :each do
        @movie1 = Movie.create(title: 'a', votes: 1)
        @movie2 = Movie.create(title: 'b', votes: 2)
        @movie3 = Movie.create(title: 'c', votes: 3)
        @movie4 = Movie.create(title: 'd', votes: 4)
        @movie5 = Movie.create(title: 'e', votes: 5)
        @movie6 = Movie.create(title: 'f', votes: 6)

      end

      it "returns the correct order of highest ranked movies" do
        get :index
        correct_order = [@movie6, @movie5, @movie4, @movie3, @movie2]
        expect(assigns(:movies)).to eq correct_order
      end

      it "returns the correct number of highest ranked movies" do
        get :index
        expect(assigns(:movies).count).to eq 5
      end

      it "does not return the correct order of highest ranked movies" do
        correct_order = [@movie2, @movie3, @movie4, @movie5, @movie6]
        expect(assigns(:movie)).to_not eq correct_order
      end

      it "does not return the correct number of highest ranked movies" do
        get :index
        expect(assigns(:movies).count).to_not eq 4
      end
    end

    context "albums" do
      before :each do
        @album1 = Album.create(title: 'a', votes: 1)
        @album2 = Album.create(title: 'b', votes: 2)
        @album3 = Album.create(title: 'c', votes: 3)
        @album4 = Album.create(title: 'd', votes: 4)
        @album5 = Album.create(title: 'e', votes: 5)
        @album6 = Album.create(title: 'f', votes: 6)

      end

      it "returns the correct order of highest ranked albums" do
        get :index
        correct_order = [@album6, @album5, @album4, @album3, @album2]
        expect(assigns(:albums)).to eq correct_order
      end

      it "returns the correct number of highest ranked albums" do
        get :index
        expect(assigns(:albums).count).to eq 5
      end

      it "does not return the correct order of highest ranked albums" do
        correct_order = [@album2, @album3, @album4, @album5, @album6]
        expect(assigns(:album)).to_not eq correct_order
      end

      it "does not return the correct number of highest ranked albums" do
        get :index
        expect(assigns(:albums).count).to_not eq 4
      end
    end
  end
end
