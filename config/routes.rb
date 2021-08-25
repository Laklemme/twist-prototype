Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :games, only: :index do
    resources :play_sessions, only: :create
  end

  resources :play_sessions, only: [:show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
