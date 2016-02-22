Rails.application.routes.draw do
  root to: "pages#home"
  #splash page
  get '/', to: 'pages#home'

  #sessions
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  # users
  get '/signup', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: "user"

  #movies
  get '/movies', to: 'movies#index', as: 'movies'
  get '/movies/new', to: 'movies#new'
  post '/movies/:id', to: 'movies#create'
  get '/movies/:id', to: 'movies#show', as: 'movie'

  #reviews
  get '/reviews', to: 'reviews#index', as: 'reviews'
  post '/reviews', to: 'reviews#create'
  get '/reviews/:id', to: 'reviews#show', as: 'review'
  get '/reviews/:id/edit', to: 'reviews#edit', as: 'edit_review'
  patch '/reviews/:id', to: 'reviews#update'
  delete '/reviews/:id', to: 'reviews#destroy', as: 'delete_review'


end
