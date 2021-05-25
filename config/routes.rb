Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :owners, controllers: {
    registrations: 'owners/registrations',
    passwords: 'owners/passwords'
  }
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :posts do
    collection do
      get 'search'
    end
  end
  resources :rooms, only: [:show, :create] do
    resources :messages, only: :create
  end
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  devise_scope :owner do
    post 'owners/guest_sign_in', to: 'owners/sessions#guest_sign_in'
  end
end
