Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :users, only: [:index] do
    member do
      post :follow
      post :unfollow
    end
  end

  resources :posts, only: [:index, :create]

  resources :clubs
  resources :players, only: [:index, :show, :update]
  resources :conversations, only: [:index, :show] do
    resources :messages, only: :create
  end
end
