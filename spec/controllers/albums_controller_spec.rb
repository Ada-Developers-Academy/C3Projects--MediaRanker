require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET #index" do
    it "responds successfully to an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "responds successfully to an HTTP 200 status code" do
      @album = Album.create(
        name: "test title",
        artist: "test artist",
        description: "test description",
        rank: 0
      )
      get :show, :id => @album.id

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
    context "VALID album" do
      let(:album_params) do
        {
          album: {
            name: "test title",
            artist: "test artist",
            description: "test description"
          }
        }
      end

      it "creates a album" do
        post :create, album_params
        expect(Album.count).to eq 1
      end

      it "redirects to the album show page" do
        post :create, album_params
        expect(subject).to redirect_to(albums_path)
      end
    end

    context "INVALID album" do
      let(:album_params) do
        {
          album: {
            artist: "test artist",
            description: "test description"
          }
        }
      end

      it "does not create a album" do
        post :create, album_params
        expect(Album.count).to eq 0
      end

      it "renders the :new action to fix album" do
        post :create, album_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    it "responds successfully to an HTTP 200 status code" do
      @album = Album.create(
        name: "test title",
        artist: "test artist",
        description: "test description",
        rank: 0
      )
      get :edit, :id => @album.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH #update" do
    context "VALID album" do

      before :each do
        @original_album = Album.create(
          name: "test title",
          artist: "test artist",
          description: "test description",
          rank: 0
        )
      end

      it "updates a album" do
        patch :update, :id => @original_album.id, album: {
          name: "edited test title",
          artist: "test artist",
          description: "test description"
        }
        # @original_album.reload
        expect(Album.find(@original_alumb.id).name).to eq "edited test title"
      end

      it "redirects to the album show page" do
        patch :update, :id => @original_album.id, album: {
          name: "edited test title",
          artist: "test artist",
          description: "test description"
        }
        expect(subject).to redirect_to(album_path(@original_album.id))
      end
    end

    context "INVALID album" do

      before :each do
        @original_album = Album.create(
          name: "test title",
          artist: "test artist",
          description: "test description",
          rank: 0
        )
      end

      it "does not update a album" do
        post :update, :id => @original_album.id, album: {
          name: "",
          artist: "test artist",
          description: "test description"
        }
        expect(Album.find(@original_alumb.id).name).to eq "test title"
      end

      it "renders the :edit action album for the same album" do
        post :update, :id => @original_album.id, album: {
          name: "",
          artist: "test artist",
          description: "test description"
        }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @album = Album.create(
        name: "test title",
        artist: "test artist",
        description: "test description",
        rank: 0
      )
    end

    it "deletes a album" do
      delete :destroy, :id => @album.id
      expect(Album.count).to eq 0
    end

    it "redirects to the albums index page" do
      delete :destroy, :id => @album.id
      expect(subject).to redirect_to(albums_path)
    end
  end

  describe "PATCH #upvote" do
    before :each do
      @album = Album.create(
        name: "test title",
        artist: "test artist",
        description: "test description",
        rank: 0
      )
    end

    it "deletes a album" do
      delete :destroy, :id => @album.id
      expect(Album.count).to eq 0
    end

    it "redirects to the album show page" do
      delete :destroy, :id => @album.id
      expect(subject).to redirect_to(albums_path)
    end
  end
end
