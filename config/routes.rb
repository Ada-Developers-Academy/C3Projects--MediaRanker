Rails.application.routes.draw do
  root 'welcome#index'

  resources :media, only: [:create, :update]

  resources :movies, controller: "media", defaults: { format: "movie" }
  resources :books, controller: "media", defaults: { format: "book" }
  resources :albums, controller: "media", defaults: { format: "album" }

end
