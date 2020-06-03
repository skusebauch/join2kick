Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :clubs, only: [:show]
  resources :players, only: [:index, :show]

end
