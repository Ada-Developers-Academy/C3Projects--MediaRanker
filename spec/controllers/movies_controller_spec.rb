require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET #index" do
    it "responds successfully to an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "responds successfully to an HTTP 200 status code" do
      @movie = Movie.create(
        name: "test title",
        director: "test director",
        description: "test description",
        rank: 0
      )
      get :show, :id => @movie.id

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
    context "VALID movie" do
      let(:movie_params) do
        {
          movie: {
            name: "test title",
            director: "test director",
            description: "test description"
          }
        }
      end

      it "creates a movie" do
        post :create, movie_params
        expect(Movie.count).to eq 1
      end

      it "redirects to the movie show page" do
        post :create, movie_params
        expect(subject).to redirect_to(movies_path)
      end
    end

    context "INVALID movie" do
      let(:movie_params) do
        {
          movie: {
            director: "test director",
            description: "test description"
          }
        }
      end

      it "does not create a movie" do
        post :create, movie_params
        expect(Movie.count).to eq 0
      end

      it "renders the :new action to fix movie" do
        post :create, movie_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    it "responds successfully to an HTTP 200 status code" do
      @movie = Movie.create(
        name: "test title",
        director: "test director",
        description: "test description",
        rank: 0
      )
      get :edit, :id => @movie.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH #update" do
    context "VALID movie" do

      before :each do
        @original_movie = Movie.create(
          name: "test title",
          director: "test director",
          description: "test description",
          rank: 0
        )
      end

      it "updates a movie" do
        patch :update, :id => @original_movie.id, movie: {
          name: "edited test title",
          director: "test director",
          description: "test description"
        }
        # @original_movie.reload
        expect(Movie.find(1).name).to eq "edited test title"
      end

      it "redirects to the movie show page" do
        patch :update, :id => @original_movie.id, movie: {
          name: "edited test title",
          director: "test director",
          description: "test description"
        }
        expect(subject).to redirect_to(movie_path(@original_movie.id))
      end
    end

    context "INVALID movie" do

      before :each do
        @original_movie = Movie.create(
          name: "test title",
          director: "test director",
          description: "test description",
          rank: 0
        )
      end

      it "does not update a movie" do
        post :update, :id => @original_movie.id, movie: {
          name: "",
          director: "test director",
          description: "test description"
        }
        expect(Movie.find(1).name).to eq "test title"
      end

      it "renders the :edit action movie for the same movie" do
        post :update, :id => @original_movie.id, movie: {
          name: "",
          director: "test director",
          description: "test description"
        }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @movie = Movie.create(
        name: "test title",
        director: "test director",
        description: "test description",
        rank: 0
      )
    end

    it "deletes a movie" do
      delete :destroy, :id => @movie.id
      expect(Movie.count).to eq 0
    end

    it "redirects to the movie show page" do
      delete :destroy, :id => @movie.id
      expect(subject).to redirect_to(movies_path)
    end
  end

  describe "PATCH #upvote" do
    before :each do
      @movie = Movie.create(
        name: "test title",
        director: "test director",
        description: "test description",
        rank: 0
      )
    end

    it "deletes a movie" do
      delete :destroy, :id => @movie.id
      expect(Movie.count).to eq 0
    end

    it "redirects to the movie show page" do
      delete :destroy, :id => @movie.id
      expect(subject).to redirect_to(movies_path)
    end
  end
end
