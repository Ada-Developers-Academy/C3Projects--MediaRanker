require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    before :each do
      @album = Album.create(title: 'a')
    end

    it "returns http success" do
      get :show, id: @album
      expect(response).to be_success
    end

    it "renders the show view" do
      get :show, id: @album
      expect(response).to render_template("show")
    end
  end

  describe "GET #edit" do
    before :each do
      @album = Album.create(title: 'a')
    end

    it "renders the edit view" do
      get :edit, id: @album
      expect(response).to render_template("edit")
    end
  end

  describe "PUT #update" do
    describe "upvote" do
      before :each do
        @album = Album.create(title: 'a')
      end

      it "updates votes" do
        put :update, id: @album, upvote: "true"
        expect(Album.find(1).votes).to eq 1
      end

      it "redirects to album show view" do
        put :update, id: @album, upvote: "true"
        expect(subject).to redirect_to(album_path(@album))
      end
    end

    describe "editing an album" do
      context "valid album params" do
        before :each do
          @album = Album.create(title: 'a')
        end

        it "updates an album" do
          put :update, id: @album, album: { title: 'b'}
          @album.reload
          expect(@album.title).to eq 'b'
        end

        it "redirects to album show view" do
          put :update, id: @album, album: { title: 'b'}
          @album.reload
          expect(response).to redirect_to(album_path(@album))
        end
      end

      context "invalid album params" do
        before :each do
          @album = Album.create(title: 'a')
        end

        it "does not update the album" do
          put :update, id: @album, album: { title: '' }
          @album.reload
          expect(@album.title).to eq 'a'
        end

        it "renders the edit page so the record can be fixed" do
          put :update, id: @album, album: { title: '' }
          @album.reload
          expect(response).to render_template("edit")
        end
      end
    end
  end

  describe "GET #new" do
    it "renders the new view" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "valid album params" do
      let(:album) do
        {
          album: {
            title: 'a'
          }
        }
      end

      it "creates an album" do
        post :create, album
        expect(Album.count).to eq 1
      end

      it "redirects to the album show page" do
        post :create, album
        expect(subject).to redirect_to(album_path(assigns(:album)))
      end
    end

    context "invalid album params" do
      let(:album) do
        {
          album: { title: '' }
        }
      end

      it "does not persist invalid records" do
        post :create, album
        expect(Album.count).to eq 0
      end

      it "renders the new page so the record can be fixed" do
        post :create, album
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @album = Album.create(title: 'a')
    end

    it "deletes a album" do
      post :destroy, id: @album
      expect(Album.count).to eq 0
    end

    it "redirects to the album index page" do
      post :destroy, id: @album
      expect(subject).to redirect_to(albums_path)
    end
  end
end
