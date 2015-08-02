Rails.application.routes.draw do

  root 'welcomes#index'

  resources :welcomes, only: [:index]
  resources :video_games
  resources :board_games
  resources :story_games

  # upvote routes
  post "/video_games/:id/upvote"  => "video_games#upvote", as: :upvote_video_game
  post "/story_games/:id/upvote"  => "story_games#upvote", as: :upvote_story_game
  post "/board_games/:id/upvote"  => "board_games#upvote", as: :upvote_board_game
end
