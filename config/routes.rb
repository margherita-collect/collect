Rails.application.routes.draw do


  devise_for :users
  devise_for :admins

  root to: 'products#index'

  resources :products, only: [:show, :index]

  resources :users, only: [:show, :edit, :update] do
  	resources :purchases, only: [:index, :create, :show]
  	resources :carts, only: [:index, :create, :destroy]
  end

  namespace :admin do
  	resources :products, only: [:new, :create, :edit, :update, :index, :show]
  	resources :purchases, only: [:index, :update]
  	resources :users, only: [:index, :show, :edit, :update]
    get "master_registration", to: "products#registration", as: "master_registration"
    post "master_registration", to: "products#create_registration", as: "create_master_registration"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
