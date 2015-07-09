require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

    describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end #describe

  describe "POST #create" do
    # + album params valid
    context "Valid album params" do
      let(:album_params) do
            { album: {
              name: "Alumbzzz",
              creator: "Van Halen",
              description: "Rock n Roll" }
            }
      end #let

      it "creates an Album record" do
        post :create, album_params
        expect(Album.count).to eq 1
      end

      it "rank is 0 right after creation" do
        post :create, album_params
        expect(Album.last.rank).to eq 0
      end

      it "redirect_to #show" do
        post :create, album_params
        expect(response).to redirect_to(album_path(Album.last.id))
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
    # + case: album is destroyed
    context "when resource is found" do
      before(:each) do
        @album_del = Album.create(name: "dizzy")
      end #before

      it "album counts changes by -1" do

        # delete :destroy, id: @album_del.id
        expect{delete :destroy, {id: @album_del.id}}.to change(Album, :count).by(-1)
      end

      it "redirect_to :albums" do
        delete :destroy, id: @album_del.id
        expect(response).to redirect_to(:albums)
      end


    end # context
  end #describe DELETE


  describe "PUT #update" do
    before(:each) do
      @album = Album.create!(
        name: "Alumbzzz",
        creator: "Van Halen",
        description: "Rock n Roll"
      )
    end

    it "sucessfully updates name" do
      put :update, :id => @album.id, :album => {name: "Albums"}
      @album.reload
      expect(@album.name).to eq("Albums")
    end

  end # describe #update

  describe "POST #upvote" do
    before(:each) do
      @album = Album.create!(
        name: "Alumbzzz",
      )
    end

    it "increases rank by 1" do
      post :upvote, :id => @album.id
      @album.reload
      expect(@album.rank).to eq 1
    end

    # test for redirect_to :album

  end


  end # controller
