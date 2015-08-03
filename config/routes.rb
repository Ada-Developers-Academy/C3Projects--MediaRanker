Rails.application.routes.draw do
  root 'welcome#index'
  
  resources :albums, :books, :movies do
    member do
      post 'upvote'
    end
  end
end
