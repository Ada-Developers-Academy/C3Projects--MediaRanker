Rails.application.routes.draw do
  root 'home#index'

  put '/movies/:id/upvote' => 'movies#upvote', as: 'upvote_movie'
  put '/books/:id/upvote' => 'books#upvote', as: 'upvote_book'
  put '/albums/:id/upvote' => 'albums#upvote', as: 'upvote_album'

  resources :movies
  resources :books
  resources :albums

  # try doing for upvote paths
  # member do
  #   patch 'upvote'
  # end
end
