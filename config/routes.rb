Rails.application.routes.draw do

  root 'welcome#index'

  resources :movies, :books, :albums

  patch 'movies/upvote/:id' => 'movies#upvote', as: :movie_upvote
  patch 'books/upvote/:id' => 'books#upvote', as: :book_upvote
  patch 'albums/upvote/:id' => 'albums#upvote', as: :album_upvote

end
