Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :clubs
  resources :players, only: [:index, :show, :update]
  resources :conversations, only: [:index, :show] do
    resources :messages, only: :create
  end
end
