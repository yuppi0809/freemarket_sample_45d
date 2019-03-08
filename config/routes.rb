Rails.application.routes.draw do
  devise_for :users

  root 'products#index'
  get '/users/mypage/identification' => 'users#identification'
  resources :users, only: [:index, :new] do
    resources :payments, path: 'credit_cards', only:[:index, :destroy], shallow:true do
    end
  end
  resources :profiles, only: [:new, :create]
  resources :products, only: [:new, :show, :index, :create] do
    get 'confirm_purchase', on: :member
  end

  resources :categories, only: :new
end
