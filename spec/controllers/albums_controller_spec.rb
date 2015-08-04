require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "a index controller"

# POST specs ---------------------------------------------------------------
  describe "POST #create" do
    context "Invalid album params" do
      let(:invalid_album_params) do
        {
          album: {
            title: "I guess"
          }
        }
      end

      it "doesn't persist invalid records" do
        post :create, invalid_album_params
        expect(Album.count).to eq(0)
      end

      it "renders the :new view (to allow user to fix input)" do
        post :create, invalid_album_params
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
 # PATCH specs --------------------------------------------------------------------
    describe "PATCH #update" do
      before(:each) do
        @album = Album.create(title: "first title", author: "first author")
      end

      after(:each) do
        @album.destroy
      end

      context "Invalid data for update of album" do
        it "renders the edit form for invalid input" do
          patch :update, id: @album, :album => {title: ''}
          expect(subject).to render_template("edit")
        end
      end

      context "Valid data for update of album" do
        it "redirects to album details after updating" do
          patch :update, id: @album.id, :album => {title: 'new title'}
          @album.reload
          expect(@album.title).to eq("new title")
          expect(response).to redirect_to(album_path(@album.id))
        end
      end
    end
  end
end
