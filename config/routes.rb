Rails.application.routes.draw do
  root 'media#root'

  # I'm so happy this worked!!!!!!11122222six
  resources :media, as: 'albums', path: 'albums'
  resources :media, as: 'books', path: 'books'
  resources :media, as: 'movies', path: 'movies'
end
