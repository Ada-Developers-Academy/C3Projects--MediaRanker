require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
    it_behaves_like "a controller"

    let(:media_params) do
          { album: {
            name: "Alumbzzz",
            creator: "Van Halen",
            description: "Rock n Roll" }
          }
    end #let

    let(:missing_params) do
          { album: {

            creator: "Van Halen",
            description: "Rock n Roll" }
          }
    end #let

    let(:media_path) {album_path(Album.last.id)}

    let(:media) {:album}
    let(:medias) {:albums}

    describe "GET #new" do
      before(:each) do
        get :new
      end

      it "creates a new item" do
        expect(assigns(:album)).to be_a_new(Album)
      end

    end




  end # controller
