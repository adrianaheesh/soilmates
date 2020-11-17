Rails.application.routes.draw do
  post 'orders/create', to: 'orders#create'
  patch 'orders/:id/update', to: 'orders#update'
  get 'orders/:id/show', to: 'orders#show'
  get 'favorites/update', to: 'favorites#update'
  get 'favorites/index', to: 'favorites#index', as: 'favorites'
  resources :products
  resources :stores do
    post 'store_reviews', to: 'store_reviews#create'
  end
  resources :order_products
  devise_for :users
  root to: 'home#page'
  get '/products/:id/buy', to: 'products#buy', as: 'buy'
  get '/orders/:id/success', to: 'orders#success', as: 'success'
  get '/products/:id/cancel', to: 'products#cancel', as: 'cancel'
end
