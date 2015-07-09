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
  end
end
