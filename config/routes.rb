Rails.application.routes.draw do
  root 'welcome#index'

  resources :movies
  resources :books
  resources :albums
end
