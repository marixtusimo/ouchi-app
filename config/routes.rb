Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :owners
  devise_for :users
  resources :rooms, only: [:show, :create] do
    resources :message, only: :create
  end
end
