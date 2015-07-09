require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT #update" do
    before :each do
      @movie = Movie.create(title: "Harry Potter", rank: 0)
    end

    let(:description_params) { { id: @movie.id, movie: { description: "yes" } } }

    # positive test - when upvote is pressed, it only updates the rank
    it "updates the rank by one when upvote is pressed" do
      put :update, id: @movie.id

      expect(Movie.find(@movie.id).rank).to eq 1
    end

    # positive test - when form is edited, it updates the form information
    it "updates the description when you edit the form" do
      put :update, description_params

      expect(Movie.find(@movie.id).description).to eq "yes"
    end

    # when it updates the form information, the upvote isn't changed
    it "doesn't change the rank when you update the description" do
      put :update, description_params

      expect(Movie.find(@movie.id).rank).to eq 0
    end

    # it redirects to the show page
    it "redirects to the movie show page" do
      put :update, description_params
      expect(subject).to render(movie_path)
    end
  end
end
