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
    # positive test - album params are valid
    context "valid album params" do
      let(:album_params) do
        {
          album: {
            title: 'some album', 
            rank: 5
          }
        }
      end

      it "creates an Album record" do
        post :create, album_params
        expect(Album.count).to eq 1
      end

      it "redirect to the album show page" do
        post :create, album_params
        expect(subject).to redirect_to(album_path(assigns(:medium)))
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
end
