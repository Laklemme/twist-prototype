Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :games, only: %i[show index] do
    resources :play_sessions, only: :create
  end

  resources :play_sessions, only: %i[show update] do
    get 'options', to: 'play_sessions#options'
    get 'reward', to: 'play_sessions#reward'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
