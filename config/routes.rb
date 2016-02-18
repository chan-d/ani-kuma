Rails.application.routes.draw do
  root to: "/"

  get '/', to: 'pages#home'

  # users
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'


end
