Rails.application.routes.draw do

  resources :users, except: :index
  resources :products
  # root 'products#index'
  resources :categories
  root 'categories#index'

  get '/admin', :to => 'products#admin'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
