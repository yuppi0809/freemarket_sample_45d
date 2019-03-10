Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'complete' => 'users/registrations#complete'
  end

  root 'products#index'
  get '/users/mypage/identification' => 'users#identification'
  resources :users, only: [:index, :new] do
    resources :listings, only:[:index, :update, :show, :destroy], shallow:true do
    end
    resources :payments, path: 'credit_cards', only:[:index, :destroy], shallow:true do
    end
  end
  resources :profiles, only: [:new, :create]
  resources :products, only: [:new, :create, :show, :index] do
    get 'confirm_purchase', on: :member
  end

  resources :categories, only: :new
end
