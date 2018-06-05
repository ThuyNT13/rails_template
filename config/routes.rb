Rails.application.routes.draw do

  # get 'users/index'
  #
  # get 'users/show'

  get '/signup', to: 'users#new'
  # get 'users/new'

  post '/signup', to: 'users#create'
  #
  # get 'users/edit'

  resources :users

  root 'pages#home'
end
