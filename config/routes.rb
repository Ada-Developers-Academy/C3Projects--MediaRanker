Rails.application.routes.draw do
  root 'media#index'

  post '/movies/:id/upvote' => 'movies#upvote'
  post '/books/:id/upvote' => 'books#upvote'
  post '/albums/:id/upvote' => 'albums#upvote'

  resources :movies, :books, :albums
  resources :media, only: [:index, :show]
end
