Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :users, only: [:index] do
    member do
      post :follow
      post :unfollow
    end
  end

  resources :posts, only: [:index, :create, :destroy]

  resources :clubs
  resources :players, only: [:index, :show, :update] do
    resources :wish_lists, only: [ :create ]
  end
  resources :conversations, only: [:index, :show] do
    resources :messages, only: :create
  end

  resources :wish_lists, only: [ :destroy, :index ]
end
