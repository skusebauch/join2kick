Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :clubs
  resources :players, only: [:index, :show]

end
