Rails.application.routes.draw do
  root 'medium#index'
  resources :books
  resources :movies
  resources :albums

  post "/books/:id"  => "books#upvote",  as: :upvote_book
  post "/movies/:id" => "movies#upvote", as: :upvote_movie
  post "/albums/:id" => "albums#upvote", as: :upvote_album
end
