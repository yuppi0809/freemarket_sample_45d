Rails.application.routes.draw do
root 'products#index'
resources :products, only: [:new, :show] do
    get 'purchase_confirm', on: :member
    end
end
