Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  # get 'users/new'

  # get 'users/index'
  #
  # get 'users/edit'
  #
  # get 'users/show'

  resources :users

  root 'pages#home'
end
