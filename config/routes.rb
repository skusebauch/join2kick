Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :clubs
  resources :players, only: [:index, :show, :update]
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
