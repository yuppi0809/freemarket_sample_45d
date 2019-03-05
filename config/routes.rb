Rails.application.routes.draw do
  devise_for :users

  root 'products#index'

  get '/users/mypage/identification' => 'users#identification'
  
  resources :users, only: :index
  resources :profiles, only: [:new, :create]
  resources :products, only: [:new, :show] do
    get 'confirm_purchase', on: :member
  end

resources :products, only: [:new, :create, :index]
resources :categories, only: [:new]
end
