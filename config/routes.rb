Rails.application.routes.draw do
root 'products#index'

resources :products, only: [:new, :show] do
    get 'confirm_purchase', on: :member
    end
resources :users, only: :index

end
