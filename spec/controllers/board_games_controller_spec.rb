require 'rails_helper'

RSpec.describe BoardGamesController, type: :controller do
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

    it "loads all of the board games into @board_games" do
      board_game1, board_game2 = BoardGame.create!(title: "Chrono Trigger"), BoardGame.create!(title: "Zelda")
      get :index

      expect(BoardGame.all).to match_array([board_game1, board_game2])
    end
  end
end
