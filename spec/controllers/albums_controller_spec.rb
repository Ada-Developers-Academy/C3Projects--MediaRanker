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
    context "Invalid album params" do
      let(:album_params) do
        {
          album: {
            title: "I guess"
          }
        }
      end

      it "doesn't persist invalid records" do
        post :create, album_params
        expect(Album.count).to eq(0)
      end

      it "renders the :new view (to allow user to fix input)" do
        post :create, album_params
        expect(response).to render_template("new")
      end
    end

    context "Valid album params" do
      let(:album_params) do
        {
          album: {
            title: "Twerking title",
            author: "Miley Cyber",
            description: "This should twerk"
          }
        }
      end

      it "save a new album" do
        post :create, album_params
        # expect(post :create, album: album_params).to change(Album, :count).by(1)
        expect(Album.count).to eq(1)
      end

      it "redirects to the album index page after saving" do
        post :create, album_params
        expect(response).to redirect_to(albums_path)
      end
    end

    describe "PATCH #update" do
      before(:each) do
        @album = Album.new(title: "first title", author: "first author")
      end

      context "Invalid data for update of album" do
        it "redirects to the edit form for invalid edits" do
          @album.update(title: "", author: "")
          expect(response).to render_template("edit")
        end
      end

      context "Valid data is accepted" do

      end
    end
  end
end
