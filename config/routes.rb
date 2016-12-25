Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'products#index'
  resources :products do
    member do
      post 'add_to_cart'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
