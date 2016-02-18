Rails.application.routes.draw do
  root to: "pages#home"
  #splash page
  get '/', to: 'pages#home'

  #sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # users
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: "profile"


end
