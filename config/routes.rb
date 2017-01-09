Rails.application.routes.draw do
  get 'reviews/new'

  get 'reviews/create'

  get 'order_products/create'

  get 'orders/new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'products#index'
  resources :products do
    member do
      post 'add_to_cart'
    end
  end
  resources :order_products, only: [:create, :destroy] do
    member do
      post 'add_same_to_cart'
      post 'remove_same_from_cart'
    end
  end

  resources :carts, only: [:show, :destroy]
  resources :orders, only: [:new, :create, :destroy]
  resources :reviews, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
