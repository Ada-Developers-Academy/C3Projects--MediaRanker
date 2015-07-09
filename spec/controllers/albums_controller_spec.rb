require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders index template" do
      get :index

      expect(response).to render_template("index")
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the :new template" do
      get :new

      expect(subject).to render_template("new")
    end

    # test which model it's creating a new form for
    it "creates a new album" do
      get :new

      expect(assigns(:album)).to be_a_new(Album)
    end
  end

  describe "POST #create" do
    # positive test - album params are valid
    context "valid album params" do
      let(:album_params) do
        { album: { title: 'some album', rank: 5 } }
      end

      before(:each) do
        post :create, album_params
      end

      it "creates an Album record" do
        expect(Album.count).to eq 1
      end

      it "redirect to the album show page" do
        expect(subject).to redirect_to(album_path(assigns(:album)))
      end
    end

    # negative test - album params are invalid
    context "invalid album params" do
      let(:album_params) do
        {
          album: { # missing the title key
            rank: 5
          }
        }
      end

      it "does not persist invalid records" do
        post :create, album_params
        expect(Album.count).to eq 0
      end

      it "renders the new template" do
        post :create, album_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    let(:album) { Album.create(title: 'some title', creator: 'some creator') }
    
    before(:each) do
      get :edit, id: album
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "finds a specific album" do
      expect(assigns(:album)).to eq(album)
    end

    it "renders the :edit template" do
      expect(subject).to render_template("edit")
    end
  end

  describe "PUT #update" do
    before(:each) do
      @album = Album.create(title: 'some title', creator: 'some person')
    end

    context "valid album params" do
      before(:each) do
        post :update, id: @album, album: { title: "updated title", creator: 'some person' }
      end

      it "updates an album with valid params" do
        @album.reload
        expect(@album.title).to eq("updated title")
      end

      it "redirects to album_path" do
        expect(subject).to redirect_to(album_path(assigns(:album)))
      end
    end

    context "invalid album params" do
      before(:each) do
        post :update, id: @album, album: { title: "", creator: 'some person' }
      end

      it "does not update an item with invalid params" do
        @album.reload
        expect(@album.title).to eq("some title")
      end

      it "renders :edit template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "PUT #upvote" do

    before(:each) do
      @album = Album.create(title: 'a title', rank: 5)
      put :upvote, id: @album
    end

    it "increases rank of record by one" do
      @album.reload
      expect(@album.rank).to eq 6
    end

    it "only affects the particular record" do
      album2 = Album.create(title: 'b title', rank: 5)

      @album.reload
      album2.reload
      expect(@album.rank).to eq 6
      expect(album2.rank).to eq 5
    end

    it "redirects to the album_path" do
      expect(subject).to redirect_to(album_path(assigns(:album)))
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @album1 = Album.create(title: 'a title', creator: 'a person')
      @album2 = Album.create(title: 'b title', creator: 'b person')
      @album3 = Album.create(title: 'c title', creator: 'c person')

      delete :destroy, id: @album3
    end

    it "deletes a particular object" do
      expect(Album.all).to_not include @album3
    end

    it "redirects to the albums_path" do
      expect(response).to redirect_to(albums_path)
    end
  end
end
