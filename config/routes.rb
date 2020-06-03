Rails.application.routes.draw do
  get 'clubs/show'
  devise_for :users
  root to: 'pages#home'
 
  resources :clubs, only: [:show]
  resources :players, only: [:index, :show]

end
