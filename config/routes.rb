Rails.application.routes.draw do
root 'products#index'
resources :products, only: [:new, :show] do
    get 'buy', on: :member
    end
end
