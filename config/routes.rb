Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # get 'users/index'
  # get 'users/show'
  get '/signup', to: 'users#new'
  # get 'users/new'
  post '/signup', to: 'users#create'
  # get 'users/edit'

  resources :users

  root 'pages#home'
end
