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
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'

  #movies
  get '/movies', to: 'movies#index', as: 'movies'
  get '/movies/new', to: 'movies#new'
  post '/movies', to: 'movies#create', as: 'new_movie'
  get '/movies/:id', to: 'movies#show', as: 'movie'



  #reviews
  get '/reviews', to: 'reviews#index', as: 'reviews'
  get 'movies/:id/reviews/new', to: 'reviews#new'
  get '/movies/:id/reviews', to: 'reviews#view', as:'movie_review'  
  post '/reviews', to: 'reviews#create', as: 'new_review'
  get '/reviews/:id', to: 'reviews#show', as: 'review'
  get '/reviews/:id/edit', to: 'reviews#edit', as: 'edit_review'
  patch '/reviews/:id', to: 'reviews#update'
  delete '/reviews/:id', to: 'reviews#destroy', as: 'delete_review'


end
