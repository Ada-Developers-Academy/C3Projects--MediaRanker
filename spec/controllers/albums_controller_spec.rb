require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
      # when you create instance variables in controllers, can access them through the assigns in terminal
    end
  end

  describe "POST #create" do
    # + album params valid
    context "Valid album params" do
      let(:album_params) do
          { album:
            {
              name: "Alumbzzz",
              creator: "Van Halen",
              description: "Rock n Roll",
            }
        }
      end

      it "creates an Album record" do
        post :create, album_params
        expect(Album.count).to eq 1
      end

      # it "rank is 0 after creation" do
      #   post :create, album_params
      #   expect(album.rank).to eq 0
      # need to set new album == instance variable
      # end
    end # + context

    # - album params invalid
  end

end
