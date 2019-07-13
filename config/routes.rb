Rails.application.routes.draw do

  devise_for :users
  devise_for :admins

  resources :products, only: [:show, :index]
  resources :users, only: [:show, :edit, :update] do
  	resource :purchases, only: [:index]
  	resource :carts, only: [:create, :destroy, :index]
  end

  namespace :admin do
  	resources :products, only: [:new, :create, :edit, :update, :index, :show]
  	resources :purchases, only: [:index, :update]
  	resources :users, only: [:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
