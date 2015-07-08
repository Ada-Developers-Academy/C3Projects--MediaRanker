Rails.application.routes.draw do
  root 'media#root'

  get "/:category" => "media#index"

  categories = ['albums', 'books', 'movies']

  categories.each do |category|
    get "/:category/new" => "media#new"
    resources :media, as: category, path: category, except: [:index, :new]
    patch "/#{ category }/:id/upvote" => "media#upvote"
  end
end
