Rails.application.routes.draw do
  root 'media#root'

  CATEGORIES_CONSTRAINTS = { category: /(albums)|(books)|(movies)/ }

  get '/:category', to: 'media#index', constraints: CATEGORIES_CONSTRAINTS
  post '/:category', to: 'media#create', constraints: CATEGORIES_CONSTRAINTS
  get '/:category/new', to: 'media#new', constraints: CATEGORIES_CONSTRAINTS
  get '/:category/:id/edit', to: 'media#edit', constraints: CATEGORIES_CONSTRAINTS
  get '/:category/:id', to: 'media#show', constraints: CATEGORIES_CONSTRAINTS
  patch '/:category/:id', to: 'media#update', constraints: CATEGORIES_CONSTRAINTS
  put '/:category/:id', to: 'media#update', constraints: CATEGORIES_CONSTRAINTS
  delete '/:category/:id', to: 'media#destroy', constraints: CATEGORIES_CONSTRAINTS
  patch '/:category/:id/upvote', to: 'media#destroy', constraints: CATEGORIES_CONSTRAINTS

 #  albums    GET    /albums(.:format)            media#index
 #            POST   /albums(.:format)            media#create
 #  new_album GET    /albums/new(.:format)        media#new
 # edit_album GET    /albums/:id/edit(.:format)   media#edit
 #      album GET    /albums/:id(.:format)        media#show
 #            PATCH  /albums/:id(.:format)        media#update
 #            PUT    /albums/:id(.:format)        media#update
 #            DELETE /albums/:id(.:format)        media#destroy
 #            PATCH  /albums/:id/upvote(.:format) media#upvote

 resources :blerg
end
