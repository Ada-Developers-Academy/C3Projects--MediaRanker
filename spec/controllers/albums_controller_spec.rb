require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

# INDEX ACTION__________________________________________________________________

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

# SHOW ACTION___________________________________________________________________

  describe "GET #show" do
    before :each do
      @album = Album.create(album_params[:album])
      @album.ranking = 0
    end

    let(:album_params) do
      {
        album: {
          name: 'a name',
          artist: 'a artist',
          description: 'a description'
        }
      }
    end

    it "renders the show template" do
      get :show, id: @album.id
      expect(response).to render_template("show")
    end
  end

# NEW ACTION____________________________________________________________________

  describe "GET #new" do

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

# CREATE ACTION_________________________________________________________________

  describe "POST #create" do

    context "Valid album params" do
      before :each do
        @album = Album.new(album_params[:album])
        @album.ranking = 0
      end

      let(:album_params) do
        {
          album: {
            name: 'a name',
            artist: 'a artist',
            description: 'a description'
          }
        }
      end

      it "creates a album record" do
        post :create, album_params
        expect(Album.count).to eq 1
      end

      it "redirects to the album show page" do
        post :create, album_params
        expect(subject).to redirect_to(album_path(assigns(:album)))
      end

      it "a new album has a 'ranking' equil to 0 by default" do
        post :create, album_params
        expect(@album.ranking).to eq_to 0
      end
    end

    context "Invalid album params" do
      let(:album_params) do
        {
          album: {
            artist: 'a artist',
            description: 'a description'
          }
        }
      end

      it "does not persist invalid records" do
        post :create, album_params
        expect(Album.count).to eq 0
      end

      it "renders the :new view if the user didn't enter a name" do
        post :create, album_params
        expect(response).to render_template("new")
      end
    end
  end

# EDIT ACTION___________________________________________________________________

  describe "GET #edit" do
    before :each do
      @album = Album.create(album_params[:album])
      @album.ranking = 0
    end

    let(:album_params) do
      {
        album: {
          name: 'a name',
          artist: 'a artist',
          description: 'a description'
        }
      }
    end

    it "renders the edit template" do
      get :edit, id: @album.id
      expect(response).to render_template("edit")
    end
  end

# UPDATE ACTION_________________________________________________________________

  describe "PATCH #update" do
    before :each do
      @album = Album.create(album_params[:album])
    end

    let(:album_params) do
      {
        album: {
          name: 'a name',
          artist: 'a artist',
          description: 'a description'
        }
      }
    end

    # When NAME field in the edit form IS NOT EMPTY
    it "updates a album record and redirects to the album show page" do
      patch :update, id: @album.id, album: { name: "updated_name" }
      @album.reload
      expect(@album.name).to eq("updated_name")
      expect(subject).to redirect_to(album_path(@album.id))
    end


    # When NAME field in the edit form IS EMPTY
    it "updates a album record" do
      patch :update, id: @album.id, album: { name: nil }
      @album.reload
      expect(response).to render_template("edit")
    end
  end


# DELETE ACTION_________________________________________________________________

  describe "DELETE #destroy" do
    before :each do
      @album = Album.create(album_params[:album])
      @album.ranking = 0
    end

    let(:album_params) do
      {
        album: {
          name: 'a name',
          artist: 'a artist',
          description: 'a description'
        }
      }
    end

    it "deletes a album record" do
      @album.destroy
      expect(Album.count).to eq 0
    end

    it "redirects to the album show page" do
      delete :destroy, id: @album.id
      expect(response).to redirect_to(albums_path)
    end
  end

# UPVOTE ACTION_________________________________________________________________

  describe "PATCH #upvote" do
    before :each do
      @album = Album.create(album_params[:album])
    end

    let(:album_params) do
      {
        album: {
          name: 'a name',
          artist: 'a artist',
          description: 'a description',
          ranking: 0
        }
      }
    end

    it "upvotes a album record " do
      patch :upvote, id: @album.id
      @album.reload
      expect(@album.ranking).to eq 1
    end
  end
end
