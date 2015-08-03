Rails.application.routes.draw do
  root 'media#root'

  categories = ["albums", "books", "games", "movies", "tvs", "webcomics"]

  regexp_string = ''
  last_index = categories.length - 1

  categories.each_with_index do |cat, index|
    regexp_string += "(#{ cat })"
    regexp_string += '|' unless index == last_index
  end

  CATEGORIES_CONSTRAINTS = { category: /#{ regexp_string }/ }

  get '/:category', to: 'media#index', as: 'index', constraints: CATEGORIES_CONSTRAINTS
  post '/:category', to: 'media#create', constraints: CATEGORIES_CONSTRAINTS
  get '/:category/new', to: 'media#new', as: 'new', constraints: CATEGORIES_CONSTRAINTS
  get '/:category/:id/edit', to: 'media#edit', as: 'edit', constraints: CATEGORIES_CONSTRAINTS
  get '/:category/:id', to: 'media#show', as: 'show', constraints: CATEGORIES_CONSTRAINTS
  patch '/:category/:id', to: 'media#update', constraints: CATEGORIES_CONSTRAINTS
  put '/:category/:id', to: 'media#update', constraints: CATEGORIES_CONSTRAINTS
  delete '/:category/:id', to: 'media#destroy', constraints: CATEGORIES_CONSTRAINTS
  patch '/:category/:id/upvote', to: 'media#upvote', constraints: CATEGORIES_CONSTRAINTS
end
