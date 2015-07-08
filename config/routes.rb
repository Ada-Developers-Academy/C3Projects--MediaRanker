Rails.application.routes.draw do
  root 'home#index'

  put '/movies/:id/upvote' => 'movies#upvote', as: 'movie_upvote'
  put '/books/:id/upvote' => 'books#upvote', as: 'book_upvote'
  put '/albums/:id/upvote' => 'albums#upvote', as: 'album_upvote'

  resources :movies
  resources :books
  resources :albums
end
