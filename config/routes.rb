Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'complete' => 'users/registrations#complete'
  end

  root 'products#index'
  resources :users, only: [:index, :new, :show]
  resources :payments, only:[:index, :new, :create, :show, :destroy]
  resources :profiles, only: [:new, :create, :edit, :update]
  resources :products, only: [:new, :create, :show, :index] do
    get 'confirm_purchase', on: :member
  end

  resources :categories, only: :new
end
