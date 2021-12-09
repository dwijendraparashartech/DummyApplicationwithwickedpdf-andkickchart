Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :orders
  get 'home/index'
  devise_for :users
  root 'home#index'
end
