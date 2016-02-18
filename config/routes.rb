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


end
