Rails.application.routes.draw do

	root 'welcome#index'
	get '/signin', to: 'sessions#new', as: 'signin' 
	post '/signin', to: 'sessions#create'

	# resources :sessions, only: [:new, :create]

  resources :users
  # get '/signup', to: 'users#new'
  # post '/signup', to: 'users#create'
  post 'rides/new', to: 'attractions#ride', as: 'rides'
  post '/logout', to: 'sessions#destroy'

  resources :attractions

end