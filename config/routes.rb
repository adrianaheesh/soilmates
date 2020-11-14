Rails.application.routes.draw do
  get 'favorites/update', to: 'favorites#update'
  resources :products
  resources :stores
  devise_for :users
  root to: 'home#page'
  get '/products/:id/buy', to: 'products#buy', as: 'buy'
  get '/products/:id/success', to: 'products#success', as: 'success'
  get '/products/:id/cancel', to: 'products#cancel', as: 'cancel'
end
