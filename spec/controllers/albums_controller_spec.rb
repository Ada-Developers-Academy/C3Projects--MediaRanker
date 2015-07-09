require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
      # when you create instance variables in controllers, can access them through the assigns in terminal
    end
  end #describe

  describe "POST #create" do
    # + album params valid
    context "Valid album params" do
      let(:album_params) do
          { album:
            {
              name: "Alumbzzz",
              creator: "Van Halen",
              description: "Rock n Roll"
            }
        }
      end #let

      it "creates an Album record" do
        post :create, album_params
        expect(Album.count).to eq 1
      end

      it "rank is 0 right after creation" do
        post :create, album_params
        expect(Album.find.last.rank).to eq 0
      # need to set new album == instance variable
      end
    end # + context

    # - album params invalid
    context "Invalid media parameters" do
      let(:album_params) do
          { album:
            {
              creator: "Van Halen",
              description: "Rock n Roll",
            }
          }
      end

      it "does not create media" do
        post :create, album_params
        expect(Album.count).to eq 0
      end
    end
  end # POST #create

  describe "DELETE #destroy" do

    it "destroys the album" do
      @album = Album.create!(
        name: "Alumbzzz",
        creator: "Van Halen",
        description: "Rock n Roll"
      )
      delete :destroy, :id => @album.id
      expect(Album.all.count).to eq 0
    end

  end # DELETE

  describe "PUT #update" do

    it "sucessfully updates name" do
      @album = Album.create!(
        name: "Alumbzzz",
        creator: "Van Halen",
        description: "Rock n Roll"
      )

      put :update, :id => @album.id, :name => "Albums"
      @album.reload

      expect(Album.first.name).to eq("Albums")

    end
    binding.pry

  end





  end # controller
