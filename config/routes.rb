Rails.application.routes.draw do
  root 'media#root'

  get "/:category" => "media#index"
  get "/:category/new" => "media#new"

  categories = ['albums', 'books', 'movies']

  categories.each do |category|
    resources :media, as: category, path: category, except: [:index, :new]
    patch "/#{ category }/:id/upvote" => "media#upvote"
  end
end
