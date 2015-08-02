require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

  describe "GET #index" do
    it "renders the index template" do
      get :index

      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    let(:album_params) do
      {
        album: {
          name: 'new album',
          artist: 'johnny appleseed',
          description: 'this is the description'
        }
      }
    end

    before :each do
      @album = Album.create(album_params[:album])
    end

    it "renders the show template" do
      get :show, id: @album.id

      expect(response).to have_http_status(200)
      expect(response).to render_template("show")
    end
  end

  describe "GET #edit" do
    let(:album_params) do
      {
        album: {
          name: 'new album',
          artist: 'johnny appleseed',
          description: 'this is the description'
        }
      }
    end

    before :each do
      @album = Album.create(album_params[:album])
    end

    it "renders the edit template" do
      get :edit, id: @album.id

      expect(response).to have_http_status(200)
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    # positive test - params are valid
    context "Valid params" do
      let(:album_params) do
        {
          album: {
            name: 'new album',
            artist: 'johnny appleseed',
            description: 'this is the description'
          }
        }
      end

      it "creates a new record" do
        post :create, album_params
        expect(Album.count).to eq 1
      end

      it "redirects to the index page" do
        post :create, album_params
        expect(subject).to redirect_to(albums_path)
      end
    end

    # negative test - params are invalid
    context "Invalid params" do
      let(:album_params) do
        {
          album: { # invalid because it's missing the :description key
            name: 'new album',
            artist: 'johnny appleseed'
          }
        }
      end

      it "does not persist invalid records" do
        post :create, album_params
        expect(Album.count).to eq 0
      end

      it "renders the :new view (to allow users to fix invalid data)" do
        post :create, album_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH #update" do
    let(:album_params) do
      {
        album: {
          name: 'new album',
          artist: 'johnny appleseed',
          description: 'this is the description'
        }
      }
    end

    let(:new_album_params) do
      {
        album: {
          name: 'new album',
          artist: 'dave johnson',
          description: 'my description'
        }
      }
    end

    before :each do
      @album = Album.create(album_params[:album])
    end

    # positive test - it updates attributes
    it "updates attributes" do
      patch :update, id: @album.id, album: new_album_params[:album]
      @album.reload
      expect(@album.artist).to eq('dave johnson')
    end

    it "redirects to the index page" do
      patch :update, id: @album.id, album: new_album_params[:album]
      @album.reload
      expect(response).to redirect_to(album_path(@album))
    end
  end 

  describe "DELETE #destroy" do
    let(:album_params) do
      {
        album: {
          name: 'new album',
          artist: 'johnny appleseed',
          description: 'this is the description'
        }
      }
    end

    before :each do
      @album = Album.create(album_params[:album])
    end

    it "deletes a record" do
      delete :destroy, id: @album.id
      expect(Album.count).to eq 0
    end
  end


end
