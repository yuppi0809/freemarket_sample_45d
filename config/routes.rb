Rails.application.routes.draw do
  devise_for :users

  root 'products#index'

  resources :users, only: :index
  resources :profiles, only: [:new, :create]
  resources :products, only: [:new, :show] do
    get 'confirm_purchase', on: :member
  end
end
