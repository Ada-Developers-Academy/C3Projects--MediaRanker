Rails.application.routes.draw do

  root 'welcome#index'

  patch 'movies/:id/upvote' =>   'movies#upvote', as: "movie_upvote"
  patch 'books/:id/upvote' =>    'books#upvote',  as: "book_upvote"
  patch 'albums/:id/upvote' =>   'albums#upvote', as: "album_upvote"

  resources :movies
  resources :books
  resources :albums

end
