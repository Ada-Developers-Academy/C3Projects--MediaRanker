require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    it "locates the correct record" do
      movie1 = Movie.new(id: 1, name: "some", creator: "okay", description: "belh", rank: 4)
      movie1.save
      params = { id: 1}


      expect(Movie.find(params[:id]).name).to eq ("some")
    end
  end

  describe "POST upvote" do
    it "adds 1 to the rank" do
      movie1 = Movie.new(id: 1, name: "some", creator: "okay", description: "belh", rank: 4)
      movie1.save
      params = { id: 1 }

      post :upvote, params
      movie1.reload

      expect(movie1.rank).to eq 5
    end
  end
end
