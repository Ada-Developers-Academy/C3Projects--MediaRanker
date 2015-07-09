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

    # positive test - when upvote is pressed, it only updates the rank
    it "updates the rank by one when upvote is pressed" do
      put :update, id: @movie.id

      expect(Movie.find(@movie.id).rank).to eq 1
    end

    # positive test - when form is edited, it updates the form information
    it "updates the description when you edit the form" do
      put :update, id: @movie.id, movie: { description: "yes" }

      expect(Movie.find(@movie.id).description).to eq "yes"
    end
    # when it updates the form information, the upvote isn't changed
    # it redirects to the show page
  end
end
