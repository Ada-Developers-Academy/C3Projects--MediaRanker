Rails.application.routes.draw do
  root 'home#index'

  resources :movies, :books, :albums do
    member do
      put 'upvote'
    end
  end
end
