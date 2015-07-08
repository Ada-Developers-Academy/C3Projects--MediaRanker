Rails.application.routes.draw do
  root 'media#root'


  categories = ['albums', 'books', 'movies']

  categories.each do |category|
    get "/:category" => "media#index", as: "#{ category }"
    get "/:category/new" => "media#new", as: "new_#{ category }"

    resources :media, as: category, path: category, except: [:index, :new]

    patch "/#{ category }/:id/upvote" => "media#upvote"
  end

  # resources :media
end
