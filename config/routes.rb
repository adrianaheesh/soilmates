Rails.application.routes.draw do
  # post 'store_reviews/create', to: 'store_reviews#create'
  get 'favorites/update', to: 'favorites#update'
  get 'favorites/index', to: 'favorites#index', as: 'favorites'
  resources :products
  resources :stores do
    post 'store_reviews', to: 'store_reviews#create'
  end
  devise_for :users
  root to: 'home#page'
  get '/products/:id/buy', to: 'products#buy', as: 'buy'
  get '/products/:id/success', to: 'products#success', as: 'success'
  get '/products/:id/cancel', to: 'products#cancel', as: 'cancel'
end
