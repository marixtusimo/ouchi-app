Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :owners
  devise_for :users
  resources :posts do
    collection do
      get 'search'
    end
  end
  resources :rooms, only: [:show, :create] do
    resources :messages, only: :create
  end
end
