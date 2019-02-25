Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :profiles, only: [:new, :create]
end
