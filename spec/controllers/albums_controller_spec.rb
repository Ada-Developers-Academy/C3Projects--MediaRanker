require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    let(:album) do
      Album.create(name: "Test Name")
    end

    it "responds successfully with HTTP 200 status code" do
      get :show, id: album

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    it "responds successfully with HTTP 200 status code" do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "valid params" do
      let(:album_params) do
        {
          album: {
            name: "Test Name",
            description: "nope"
          }
        }
      end

      it "creates a record" do
        post :create, album_params

        expect(Album.count).to eq(1)
      end

      it "redirects to #show" do
        post :create, album_params

        expect(response).to redirect_to(album_path(Album.last))
      end
    end

    context "invalid params" do
      let(:invalid_album_params) do
        {
          album: {
            # no :name, which is required,
            description: "nope"
          }
        }
      end

      it "doesn't create invalid records" do
        post :create, invalid_album_params

        expect(Album.count).to eq(0)
      end

      it "renders #new" do
        post :create, invalid_album_params

        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    let(:album) do
      Album.create(name: "Test Name")
    end

    it "responds successfully with HTTP 200 status code" do
      get :edit, id: album

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT #update" do
    let(:album) do
      Album.create(name: "Test Name")
    end

    it "updates a record" do
      put :update, id: album, album: { name: "Changed Name" }
      album.reload

      expect(album.name).to eq("Changed Name")
    end

    it "on successful update, redirects to #show" do
      post :update, id: album, album: { description: "Changed Name" }

      expect(response).to redirect_to(album_path(album))
    end

    it "on unsuccessful update, renders #edit" do
      post :update, id: album, album: { name: nil }

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("edit")
    end
  end

  describe "DELETE #destroy" do
    let(:album) do
      Album.create(name: "Test Name")
    end

    it "has one record" do
      album

      expect(Album.count).to eq(1)
    end

    it "destroys a record" do
      delete :destroy, id: album

      expect(Album.count).to eq(0)
    end

    it "redirects to #index" do
      delete :destroy, id: album

      expect(response).to redirect_to(albums_path)
    end
  end

  describe "POST #upvote" do
    let(:album) do
      Album.create(name: "Test Name")
    end

    it "defaults :rank to 0 on record creation" do
      expect(album.rank).to eq(0)
    end

    it "increments :rank by 1" do
      post :upvote, id: album
      album.reload

      expect(album.rank).to eq(1)
    end

    it "increments :rank multiple times" do
      10.times do
        post :upvote, id: album
      end
      album.reload

      expect(album.rank).to eq(10)
    end

    it "redirects to #show" do
      post :upvote, id: album

      expect(response).to redirect_to(album_path(album))
    end
  end
end
