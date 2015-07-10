require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET index" do

    it "routes GET /movies to movies#index" do
      expect(get: '/movies').to route_to('movies#index')
    end

    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "generates /movies from movies_path" do
      expect(movies_path).to eq('/movies')
    end
  end

  describe "you can interact with a specific movie" do
    before :each do
      @movie = Movie.create(name: "name_thing")
    end

    it "renders the #show view" do
      get :show, id: @movie
      expect(response).to render_template("show")
    end

    it "renders the #new view" do
      get :new, id: @movie
      expect(response).to render_template("new")
    end

    it "renders the #edit view" do
      get :edit, id: @movie
      expect(response).to render_template("edit")
    end

    it "increases the rank when you upvote" do
      patch :upvote, id: @movie
      @movie.reload
      expect(@movie.rank).to eq(1)
    end

    it "deletes a given movie" do
      delete :destroy, id: @movie
      expect(Movie.count).to eq(0)
    end
  end

  describe "makes new movies" do
    let(:valid_movie) do {
      movie: { name: "name1"}
    }
    end

    it "creates a new Movie" do
      post :create, valid_movie
      expect(Movie.count).to eq(1)
    end

    it "redirects to the movie show page" do
      post :create, valid_movie
      expect(response).to redirect_to(movie_path(assigns(:media)))
    end
  end

  describe "movies can be edited" do
    let(:movie) {Movie.create(name: "name1", rank: 20)}

    it "updates an movie with valid params" do
      post :update, id: movie, movie: {name: "Edited name", rank: 20}
      movie.reload
      expect(movie.name).to eq("Edited name")
    end

    it "redirects to the movie show page" do
      post :update, id: movie, movie: {name: "Edited name", rank: 20}
      expect(response).to redirect_to(movie_path(assigns(:media)))
    end
  end
end
