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
      Album.create(name: "Test1")
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
            name: "Test2",
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
  end

  context "invalid params" do
    let(:album_params) do
      {
        album: {
          # no :name, which is required,
          description: "nope"
        }
      }
    end

    it "doesn't create invalid records" do
      post :create, album_params

      expect(Album.count).to eq(0)
    end

    it "renders #new" do
      post :create, album_params

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    let(:album) do
      Album.create(name: "Test3")
    end

    it "responds successfully with HTTP 200 status code" do
      get :edit, id: album

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT #update" do
    let(:album) { Album.create(name: "Test4", description: "nope") }

    it "updates a record" do
      put :update, id: album, album: { description: "yep" }
      album.reload
      expect(album.description).to eq("yep")
    end

    it "on successful update, redirects to #show" do
      post :update, id: album, album: { description: "yep" }

      expect(response).to redirect_to(album_path(album))
    end

    it "on unsuccessful update, renders #edit" do
      post :update, id: album, album: { name: nil }

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("edit")
    end

  end

  # describe destroy

  # describe upvote

end
