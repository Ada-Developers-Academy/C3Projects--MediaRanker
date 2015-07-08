require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET #index" do
    it "responds sucessfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "Valid album params" do
      let(:album_params) do
        {
          album: {
            name: 'album name',
            artist: 'artist name',
            description: 'some descrip'
          }
        }
      end

      it "creates an Album record" do
        post :create, album_params
        expect(Album.count).to eq 1
      end

      it "redirects to the Album show page" do
        post :create, album_params
        expect(subject).to redirect_to(album_path(assigns(:album)))
      end
    end

    context "Invalid params" do
      let(:album_params) do
        {
          album: {
            artist: 'artist name',
            description: 'some descrip'
          }
        }
      end

      it "does not persist invalid records" do
        post :create, album_params
        expect(Album.count).to eq 0
      end

      it "renders the :new view so user can fix missing data" do
        post :create, album_params
        expect(subject).to render_template("new")
      end
    end
  end

  describe "GET #new" do
    it "responds sucessfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #edit" do
    it "responds sucessfully with an HTTP 200 status code" do
      album = Album.create(name: 'whatever')

      get :edit, {:id => '1'}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "responds sucessfully with an HTTP 200 status code" do
      album = Album.create(name: 'whatever')

      get :edit, {:id => '1'}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT #update" do
    context "Editing entry" do
      it "replaces entry with new info" do
        old_album = Album.create(name: 'old name', artist: 'old artist', description: 'old descrip')

        put :update, {:id => 1, :name => 'new name', :artist => 'new artist', :description => 'new description'}

        expect(old_album.name).to eq('new name')
      end
    end

    context "Clicking upvote button" do

    end
  end

end
