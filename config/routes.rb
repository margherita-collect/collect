Rails.application.routes.draw do


  resources :products, only: [:show, :index]
  devise_for :users

  get 'products/index'
  get 'products/show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

