Rails.application.routes.draw do
root 'products#index'
resources :products, only: [:new, :create, :index]
resources :categories, only: [:new]
end
