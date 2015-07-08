require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "valid album params" do
      let(:album_params) do
        {
          album: {
            name: "title",
            author: "author",
            desc: "desc",
            vote: 2
          }
        }
      end

      it "creates a Album record" do
        post :create, album_params
        expect(Album.count).to eq 1
      end

      it "redirects to the Album show page" do
        post :create, album_params
        expect(subject).to redirect_to(album_path(assigns(:album)))
      end
    end

    context "invalid album params" do
      let (:album_params) do
        {
          album: { 
            author: "author",
            desc: "desc",
            vote: 2
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
      @album = Album.create(name: "name")
    end
    
    context "valid album params" do
      it "updates an existing album record" do
        patch :update, id: @album.id, album: { name: "title" }
        @album.reload
        expect(@album.name).to eq "title"
      end

      it "redirects to the Album show page" do
        patch :update, id: @album.id, album: { name: "title" }
        @album.reload
        expect(subject).to redirect_to(album_path)
      end
    end

    context "invalid album params" do
      it "does not persist invalid record updates" do
        patch :update, id: @album.id, album: { desc: "desc" }
        expect(subject).to redirect_to(album_path)
      end
    end
  end

  describe "POST #upvote" do
    before :each do 
      @album = Album.create(name: "name", vote: 0)
    end

    context "clicking upvote button" do
      it "increases the upvote count by 1" do
        post :upvote, id: @album.id
        @album.reload
        expect(@album.vote).to eq 1
      end

      it "redirects to the Album show page" do
        patch :upvote, id: @album.id
        @album.reload
        expect(subject).to redirect_to(album_path)
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do 
      @album = Album.create(name: "name")
    end

    context "clicking the delete button" do
      it "removes a record" do
        delete :destroy, id: @album.id
        expect(Album.count).to eq 0
      end

      it "redirects to the Album show page" do
        delete :destroy, id: @album.id
        expect(subject).to redirect_to(albums_path)
      end
    end
  end
end
