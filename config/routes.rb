Rails.application.routes.draw do

  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'purchases/index'
  end
  namespace :admin do
    get 'products/new'
    get 'products/edit'
    get 'products/index'
    get 'products/show'
  end
  get 'carts/index'
  get 'purchases/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  devise_for :admins

  resources :products, only: [:show, :index]
  resources :users, only:[:show, :edit, :update] do
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

