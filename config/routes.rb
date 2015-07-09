Rails.application.routes.draw do
  root 'media#root'


  categories = ['albums', 'books', 'movies']

  categories.each do |category|
    resources :media, as: category, path: category

    patch "/#{ category }/:id/upvote" => "media#upvote"
  end

  # resources :media
end
