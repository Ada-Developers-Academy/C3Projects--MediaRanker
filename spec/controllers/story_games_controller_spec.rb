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
      story_game1, story_game2 = StoryGame.create(title: "Final Girl"), StoryGame.create(title: "Monster Hearts")
      get :index

      expect(StoryGame.all).to match_array([story_game1, story_game2])
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      story_game = StoryGame.create(title: "Story Game")
      get :show, id: story_game.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "displays information related to the given record" do
      story_game = StoryGame.create(title: "Story Game")
      get :show, id: story_game.id
      expect(story_game.title).to eq 'Story Game'
    end
  end # end of describe block

  describe "POST #create" do
    context "valid story game params" do
      let(:story_game_params) do {
        story_game:{
          title: 'a title',
          author: 'an author',
          description: 'a description'
        }
      }
      end

      it "creates a story game record" do
        post :create, story_game_params
        expect(StoryGame.count).to eq 1
      end

      it "redirects to the story game show page" do
        post :create, story_game_params
        expect(response).to redirect_to(story_game_path(assigns(:story_game)))
      end #
    end # end of let

# negative test, story game params are invalid
    context "invalid story game params" do
      let(:story_game_params) do {
        story_game:{
          author: 'author',
          description: 'description'
        }
      }
      end

      it "does not persist invalid records" do
        post :create, story_game_params
        expect(StoryGame.count).to eq 0
      end

      it "redirects to the #new page after input fails" do
        post :create, story_game_params
        expect(response).to redirect_to(new_story_game_path)
      end
    end #end of let
  end #end of describe block

  describe "PUT #edit" do
    let(:story_game) {StoryGame.create(title: "Game Title")}
      it "updates an existing record" do
        post :update, id: story_game, story_game: {title: "Title"}
        story_game.reload
        expect(story_game.title).to eq("Title")
      end
  end #end of describe block

  describe "DELETE #destroy" do
    it "deletes the given story game record" do
    story_game = StoryGame.create(title: "story game")
    expect {
      delete :destroy, {:id => story_game.to_param}
    }.to change(StoryGame, :count).by(-1)
    end
  end # end of describe block

  describe "POST #upvote" do
    it "updates the ranking by 1 with each upvote" do
      story_game = StoryGame.create(title: "Story game")
      post :upvote, id: story_game
      story_game.reload
      expect(story_game.rating).to eq 2
    end
  end

end #end of class
