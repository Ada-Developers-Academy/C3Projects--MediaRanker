require 'rails_helper'

RSpec.describe StoryGamesController, type: :controller do
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

    it "loads all of the story games into @story_games" do
      story_game1, story_game2 = StoryGame.create(title: "Final Girl"), StoryGame.create!(title: "Monster Hearts")
      get :index

      expect(StoryGame.all).to match_array([story_game1, story_game2])
    end
  end

  # describe "GET #show" do
  #   let (:story_game) { StoryGame.new(title: "My Daughter Queen of France")}
  #
  #   it "responds successfully with an HTTP 200 status code" do
  #     get story_game_path(@story_game)
  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #   end
  #
  #   it "renders the show template" do
  #     get story_game_path(@story_game)
  #     expect(response).to render_template("show")
  #   end
  #
  #   it "loads given story game title information" do
  #     get story_game_path(@story_game)
  #
  #     expect()
  #   end
  # end

  describe "POST create" do
    it "creates a new contact" do
      post :create
      expect{ post :create }.to change(StoryGame,:count).by(1) end

    it "redirects to the new contact" do
      post :create
      response.should redirect_to StoryGame.last
    end
  end

end #end of class
