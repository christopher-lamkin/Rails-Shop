Rails.application.routes.draw do
  resources :products

  root 'products#index'

  get '/admin', to: => 'products#admin'
end
