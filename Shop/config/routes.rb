Rails.application.routes.draw do
  resources :products

  root '#index'
end
