require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    before :each do
      @movie = Movie.create(title: 'a')
    end

    it "returns http success" do
      get :show, id: @movie
      expect(response).to be_success
    end

    it "renders the show view" do
      get :show, id: @movie
      expect(response).to render_template("show")
    end
  end

  describe "PUT #update" do
    context "valid movie params" do
      before :each do
        @movie = Movie.create(title: 'a', votes: 1)
      end

      it "updates votes" do
        put :update, id: @movie.id, votes: @movie.votes, upvote: true
        expect(Movie.find(1).votes).to eq 2
      end

      # it "redirects to movie show view" do
      #   put :update, id: @movie
      #   expect(subject).to redirect_to(movie_path(assigns(@movie)))
      # end
    end
  end
end
