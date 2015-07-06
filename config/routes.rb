Rails.application.routes.draw do
  root 'home#index'

  resources :movies
  # resources :books
  # resources :albums
end
