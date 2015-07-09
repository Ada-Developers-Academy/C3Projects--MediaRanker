require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET #index" do
     it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #upvote" do

    it "add 1 to the album rank" do
      album = Album.create(name: "Cool Album", artist: "some person", description: "cool", rank: 5)
      album.upvote

      expect(album.rank).to eq 6
    end
  end
end
