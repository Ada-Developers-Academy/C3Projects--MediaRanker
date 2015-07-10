require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET index" do

    it "routes GET /albums to albums#index" do
      expect(get: '/albums').to route_to('albums#index')
    end

    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "generates /albums from albums_path" do
      expect(albums_path).to eq('/albums')
    end
  end

  describe "shows an album" do
    let(:valid_album) do {
      album: { name: "name1"}
    }
    end

    it "renders the #show view" do
      get :show, valid_album
      expect(response).to render(album_path(assigns(:media)))
    end
  end

  describe "makes new albums" do
    let(:valid_album) do {
      album: { name: "name1"}
    }
    end

    it "creates a new Album" do
      post :create, valid_album
      expect(Album.count).to eq(1)
    end

    it "redirects to the album show page" do
      post :create, valid_album
      expect(response).to redirect_to(album_path(assigns(:media)))
    end
  end

  # describe "it won't create an invalid album" do
  #   let(:invalid_album) do {
  #     album: { creator: "creator1"}
  #   }
  #   end
  #
  #   it "does not persist an invalid album" do
  #     post :create, invalid_album
  #     expect(Album.count).to eq(0)
  #   end
  # end


  describe "albums can be edited" do
    let(:album) {Album.create(name: "name1", rank: 20)}

    it "updates an album with valid params" do
      post :update, id: album, album: {name: "Edited name", rank: 20}
      album.reload
      expect(album.name).to eq("Edited name")
    end
  end
end
