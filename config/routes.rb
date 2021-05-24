Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :owners
  devise_for :users
  resources :posts
  resources :rooms, only: [:show, :create] do
    resources :messages, only: :create
  end
end
