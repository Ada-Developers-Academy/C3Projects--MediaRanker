Rails.application.routes.draw do
  root 'media#root'

  categories = Category.all.map { |category| category.url_plural }

  regexp_string = ''
  last_index = categories.length - 1

  categories.each_with_index do |cat, index|
    regexp_string += "(#{ cat })"
    regexp_string += '|' unless index == last_index
  end

  CATEGORIES_CONSTRAINTS = { category: /#{ regexp_string }/ }

  get '/:category', to: 'media#index', constraints: CATEGORIES_CONSTRAINTS
  post '/:category', to: 'media#create', constraints: CATEGORIES_CONSTRAINTS
  get '/:category/new', to: 'media#new', constraints: CATEGORIES_CONSTRAINTS
  get '/:category/:id/edit', to: 'media#edit', constraints: CATEGORIES_CONSTRAINTS
  get '/:category/:id', to: 'media#show', constraints: CATEGORIES_CONSTRAINTS
  patch '/:category/:id', to: 'media#update', constraints: CATEGORIES_CONSTRAINTS
  put '/:category/:id', to: 'media#update', constraints: CATEGORIES_CONSTRAINTS
  delete '/:category/:id', to: 'media#destroy', constraints: CATEGORIES_CONSTRAINTS
  patch '/:category/:id/upvote', to: 'media#upvote', constraints: CATEGORIES_CONSTRAINTS
end
