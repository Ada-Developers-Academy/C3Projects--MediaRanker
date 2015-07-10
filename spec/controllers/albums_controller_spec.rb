require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET index" do
    it "renders the :index view for all Albums" do
       get :index
       expect(response).to render_template("index")
    end

    it "loads all of the albums into @albums" do
      album1, album2 = Album.create(:name => "First Album Name"), Album.create(:name => "2nd Album Name")
      get :index
      expect(assigns(:albums)).to match_array([album1, album2])
    end
  end

  describe "GET #show" do
    before(:each) do
      @album = Album.create(name: "Album Name")
    end

    after :each do
      @album.destroy
    end

    it "renders the :show view for a album" do
       get :show, id: @album
       expect(response).to render_template("show")
    end

    it "loads a album into @album" do
      get :show, id: @album
      expect(assigns(:album)).to eq(@album)
    end
  end

  describe "POST #upvote" do
    before :each do
      @album = Album.create(name: "Zer0 Album", rank: 0)
    end

    after :each do
      @album.destroy
    end

    context "upvoting a album" do
      it "increases the rank by 1" do
        post :upvote, id: @album.id
        @album.reload
        expect(@album.rank).to eq 1
      end

      it "redirects to the Album show page" do
        patch :upvote, id: @album.id
        expect(subject).to redirect_to(album_path)
      end
    end
  end

    describe "GET #new" do
      let (:cd_params) do
        {
          album: { name: "New Chapter" }
        }
      end

      it "creates a new Album object" do
        get :new, cd_params
        expect(assigns(:album)).to be_kind_of(Object)
      end
  end

  describe "POST create" do
    context "Valid album params" do
      let(:album_params) do # any name to rep the params
        {
          album: {
            name: 'Jurassic Universe',
            artist: 'Spielberg',
            description: 'RAWR.',
            rank: 1
          }
        }
      end

      it "creates an Album record" do
        post :create, album_params # this calls the let
        expect(Album.count).to eq 1
      end

      it "renders to the album's show page" do
        post :create, album_params
        expect(response).to render_template("show")
      end
    end

    context "Invalid album params" do

      let(:invalid_album_params) do
        {
          album: {
            artist: 'Steven',
            description: 'Tiny arms galore',
            rank: 2
          }
        }
      end

      it "does not persist invalid records" do
        post :create, invalid_album_params
        expect(Album.count).to eq 0
      end

      it "renders the :new view (to allow users to fix invalid data)" do
        post :create, invalid_album_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @album = Album.create(:name => "New Warz")
    end

    after :each do
     @album.destroy
    end


    context "successful deletion" do
      it "deletes a record" do
        delete :destroy, id: @album.id
        expect(Album.count).to eq 0
      end

      it "redirects to the album index page" do
        delete :destroy, id: @album.id
        expect(subject).to redirect_to(albums_path)
      end

    end

  end
    # let(:edited_info) do
    #   { :name => 'New Album Name' }
    # end

  describe "PATCH #update" do

    before(:each) do
      @album = Album.create(name: 'Album Name')
    end

    after :each do
      @album.destroy
    end

    context "valid album params" do

      it "updates an an existing album record" do
        patch :update, id: @album.id, album: { name: "Different Album Name" }
        @album.reload
        expect(@album.name).to eq "Different Album Name"
      end

      it "redirects to the album's show page" do
        patch :update, id: @album.id, album: { name: "Different Album Name" }
        @album.reload
        expect(subject).to redirect_to(album_path)
      end
    end

    context "invalid album params" do

      it "does not persist invalid records" do
        patch :update, id: @album.id, album: { name: "" }
        expect(@album.name).to eq "Album Name"
      end

      it "renders the :edit view (to allow users to fix invalid data)" do
        patch :update, id: @album.id, album: { name: "" }
        expect(subject).to render_template("edit")
      end
    end
  end
end
