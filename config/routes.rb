Rails.application.routes.draw do
  root 'welcome#index'

  resources :media, only: [:create, :update]

  resources :movies, controller: "media"
  resources :books, controller: "media"
  resources :albums, controller: "media"

end
