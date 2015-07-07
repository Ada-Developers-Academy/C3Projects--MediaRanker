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
        expect(Album.count).to eq 0
      end
    end
  end
end
