Rails.application.routes.draw do
<<<<<<< HEAD

  devise_for :admins
  devise_for :users

  resources :products, only: [:show, :index]
  resources :users, only: [:edit, :update, :show] do
  	resource :carts, only: [:create, :destroy, :index]
  	resource :purchases, only: [:index]
  end

  namespace :admin do
  	resources :products, only: [:new, :create, :edit, :update, :index, :show]
  	resources :purchases, only: [:index, :update]
  	resources :users, only: [:index, :show, :edit, :update]
  end

=======
  get 'products/index'
  get 'products/show'
>>>>>>> 8aa9e619f4a317f80249d5429b79177870a31d2c
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
