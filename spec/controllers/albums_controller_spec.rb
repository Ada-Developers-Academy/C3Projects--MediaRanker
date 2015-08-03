require 'rails_helper'
require 'support/shared_controller_examples'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "medium"

  describe "GET #show" do
    it "renders the show template" do
      album = create :album
      get :show, id: album.id

      expect(response).to have_http_status(200)
      expect(response).to render_template("show")
    end
  end

  describe "GET #edit" do
    it "renders the edit template" do
      album = create :album
      get :edit, id: album.id

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
    before :each do
      @album = create :album, artist: "johnny appleseed"
    end

    # positive test - it updates attributes
    it "updates attributes" do
      patch :update, id: @album.id, album: FactoryGirl.attributes_for(:album, artist: "dave johnson")
      @album.reload
      expect(@album.artist).to eq('dave johnson')
    end

    it "redirects to the index page" do
      patch :update, id: @album.id, album: FactoryGirl.attributes_for(:album, artist: "dave johnson")
      @album.reload
      expect(response).to redirect_to(album_path(@album))
    end
  end 

  describe "DELETE #destroy" do
    it "deletes a record" do
      album = create :album
      delete :destroy, id: album.id
      expect(Album.count).to eq 0
    end
  end


end
