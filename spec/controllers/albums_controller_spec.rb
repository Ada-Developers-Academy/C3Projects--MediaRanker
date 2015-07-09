require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    # it "renders index template" do
    #   get :index

    #   expect(response).to render_template("index")
    # end
  end

  # describe "GET #new" do
  #   it "responds successfully with an HTTP 200 status code" do
  #     get :new

  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #   end

  #   it "renders the :new template" do
  #     get :new

  #     expect(subject).to render_template("new")
  #   end

  #   # test which model it's creating a new form for
  #   it "creates a new album" do
  #     get :new

  #     expect(assigns(:medium)).to be_a_new(Album)
  #   end
  # end

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

  # describe "GET #edit" do
  #    it "responds successfully with an HTTP 200 status code" do
  #     get :edit

  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #   end

  #   it "renders the :edit template" do
  #     get :edit

  #     expect(subject).to render_template("edit")
  #   end

  #   # test which model it's creating an edit form for?
  # end

  describe "PUT #update" do
    context "valid album params" do
      let(:album) { Album.create(title: 'some title', creator: 'some person') }

      # it "updates an Album record" do
      #   @medium = Album.create(:album_params)
      #   put :update, id: @medium, new_album_params
      #   @medium.reload
      #   expect(@medium.creator).to eq "some other person"
      # end 

      it "updates an item with valid params" do
        post :update, id: album, album: { title: "updated title", creator: 'some person' }
        album.reload
        expect(album.title).to eq("updated title")
      end
    end



  end

  # describe "PUT #upvote" do
  #   let(:album_params) do
  #       {
  #         title: 'some thing',
  #         creator: 'some person',
  #         description: 'an interesting thing',
  #         rank: 5
  #       }
  #   end

  #   it "increases rank of record by one" do
  #     medium = Album.create(:album_params)
  #     put :upvote, medium
  #     expect(medium.rank).to eq 6
  #   end
  # end

  # describe "DELETE #destroy" do
  #   # how to test around confirm button?
  # end
end
