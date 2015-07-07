Rails.application.routes.draw do
  root 'media#root'

  get "/:category" => "media#index"

  categories = ['albums', 'books', 'movies']

  categories.each do |category|
    resources :media, as: category, path: category, except: :index
    patch "/#{ category }/:id/upvote" => "media#upvote"
  end
end
