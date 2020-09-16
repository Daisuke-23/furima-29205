Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"

  resources :users, only: [:index, :edit, :update, :create]

  resources :items do
  resources :orders,  only: [:index, :create]
  post :edit

  end

end

