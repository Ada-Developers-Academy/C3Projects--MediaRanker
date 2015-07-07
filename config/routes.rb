Rails.application.routes.draw do
  root 'categories#index'

  resources :albums
  resources :books
  resources :movies
end
