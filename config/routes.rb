Rails.application.routes.draw do
root 'products#index'
resources :products, only: [:new, :create, :index]
get 'products/middlecategory' => 'products#middlecategory'
end
