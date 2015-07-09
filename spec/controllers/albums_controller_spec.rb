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
            {
              name: "Alumbzzz",
              creator: "Van Halen",
              description: "Rock n Roll"
            }
      end #let

      it "creates an Album record" do
        post :create, album_params
        expect(Album.count).to eq 1
      end

      it "rank is 0 right after creation" do
        post :create, album_params
        expect(Album.last.rank).to eq 0
      # need to set new album == instance variable
      end

      # it "redirect_to #show" do
      #   post :create, album_params
      #   expect(response).to redirect_to(Album.last)
      # end
    end # + context

    # - album params invalid
    # context "Invalid media parameters" do
    #   let(:album_params) do
    #       { album:
    #         {
    #           creator: "Van Halen",
    #           description: "Rock n Roll",
    #         }
    #       }
    #   end
    #
    #   it "does not create media" do
    #     post :create, album_params
    #     expect(Album.count).to eq 0
    #   end
    # end
  end # POST #create

  describe "DELETE #destroy" do
    # + case: album is destroyed
    context "when resource is found" do
      let (:album_params) do
        {
          album:
          { id: 20, name: "Alumbzzz", creator: "Van Halen", description: "Rock n Roll"}
        }
      end #let

      it "album counts changes by -1" do

        @album_del = Album.new{:album}
        binding.pry
        delete :destroy, {id: @album_del.id}
        expect(Album.count).to change_by(-1)

      end
    end # context

    # - case: album not found
    context 'when resource is not found' do
      it 'responds with 404' do
        delete :destroy, :id => 100
        expect(response).to have_http_status(404)
      end
 end

  end # DELETE

  # describe "PUT #update" do
  #
  #   it "sucessfully updates name" do
  #
  #     @album = Album.create!(
  #       name: "Alumbzzz",
  #       creator: "Van Halen",
  #       description: "Rock n Roll"
  #     )
  #
  #     put :update, :id => @album.id, :name => {name: "Albums"}
  #     @album.reload
  #
  #     expect(@album.name).to eq("Albums")
  #
  #   end
  #   binding.pry
  #
  # end

  describe "POST #upvote" do
    before(:each) do



    end
    it "increases rank by 1" do
      @album = Album.create!(
        name: "Alumbzzz",
        creator: "Van Halen",
        description: "Rock n Roll"
      )
      @album.reload

      post :upvote, :id => @album.id
      @album.reload
      expect(@album.rank).to eq 1
    end

    # + test: rank is now 1
    # - test: ??
    # test for redirect_to :album

  end


  end # controller
