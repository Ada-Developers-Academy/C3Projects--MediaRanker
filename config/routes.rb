Rails.application.routes.draw do
  root 'home#index'

  put '/movies/:id/upvote' => 'movies#upvote', as: 'upvote_movie'

  resources :movies
  resources :books
  resources :albums
end
