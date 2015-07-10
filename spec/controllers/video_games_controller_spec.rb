require 'rails_helper'

RSpec.describe VideoGamesController, type: :controller do
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

    it "loads all of the video games into @video_games" do
      video_game1, video_game2 = VideoGame.create!(title: "Chrono Trigger"), VideoGame.create!(title: "Zelda")
      get :index

      expect(VideoGame.all).to match_array([video_game1, video_game2])
    end
  end # end of define

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      video_game = VideoGame.create(title: "Video Game")
      get :show, id: video_game.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "displays information related to the given record" do
      video_game = VideoGame.create(title: "Video Game")
      get :show, id: video_game.id
      expect(video_game.title).to eq 'Video Game'
    end
  end # end of describe block

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      video_game = VideoGame.create(title: "Video Game")
      get :new, id: video_game.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "displays information related to the given record" do
      video_game = VideoGame.create(title: "Video Game")
      get :new, id: video_game.id
      expect(video_game.title).to eq 'Video Game'
    end
  end # end of describe block

  describe "POST #create" do
    context "valid video game params" do
      let(:video_game_params) do {
        video_game:{
          title: 'a title',
          author: 'an author',
          description: 'a description'
        }
      }
      end

      it "creates a video game record" do
        post :create, video_game_params
        expect(VideoGame.count).to eq 1
      end

      it "redirects to the video game show page" do
        post :create, video_game_params
        expect(response).to redirect_to(video_game_path(assigns(:video_game)))
      end #
    end # end of let

# negative test, video game params are invalid
    context "invalid video game params" do
      let(:video_game_params) do {
        video_game:{
          author: 'author',
          description: 'description'
        }
      }
      end

      it "does not persist invalid records" do
        post :create, video_game_params
        expect(VideoGame.count).to eq 0
      end

      it "redirects to the #new page after input fails" do
        post :create, video_game_params
        expect(response).to redirect_to(new_video_game_path)
      end
    end #end of let
  end #end of describe block

  describe "GET #edit" do
    it "responds successfully with an HTTP 200 status code" do
      video_game = VideoGame.create(title: "Video Game")
      get :edit, id: video_game.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "displays information related to the given record" do
      video_game = VideoGame.create(title: "Video Game")
      get :edit, id: video_game.id
      expect(video_game.title).to eq 'Video Game'
    end
  end # end of describe block

  describe "PUT #edit" do
    let(:video_game) {VideoGame.create(title: "Game Title")}
      it "updates an existing record" do
        post :update, id: video_game, video_game: {title: "Title"}
        video_game.reload
        expect(video_game.title).to eq("Title")
      end
  end #end of describe block

  describe "DELETE #destroy" do
    it "deletes the given video game record" do
    video_game = VideoGame.create(title: "video game")
    expect {
      delete :destroy, {:id => video_game.to_param}
    }.to change(VideoGame, :count).by(-1)
    end
  end # end of describe block

  describe "POST #upvote" do
    it "updates the ranking by 1 with each upvote" do
      video_game = VideoGame.create(title: "Video game")
      post :upvote, id: video_game
      video_game.reload
      expect(video_game.rating).to eq 2
    end
  end


end # end of controller class
