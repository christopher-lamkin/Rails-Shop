Rails.application.routes.draw do

  resources :users, except: :index

  resources :products
  root 'products#index'

  get '/admin', :to => 'products#admin'
end
