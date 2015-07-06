Rails.application.routes.draw do
  root 'medium#index'
  resources :books
  resources :movies
  resources :albums
end
