Rails.application.routes.draw do
  post '/provider_login',    to: 'service_provider_sessions#create'
  post '/provider_logout',   to: 'service_provider_sessions#destroy'
  get '/provider_logged_in', to: 'service_provider_sessions#is_service_provider_logged_in?'
  get '/provider_logged_in', to: 'service_provider_sessions#is_service_provider_logged_in?'
  get '/filter_service_provider', to: 'service_providers#filter_service_provider'
  get '/set_provider_favorites', to: 'service_providers#set_provider_favorites'
  get '/show_favorites', to: 'service_providers#show_favorites'
  resources :service_providers, only: [:create, :show, :index]

  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  
  resources :consumers, only: [:create, :show, :index]
  resources :users, only: [:create, :show, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
