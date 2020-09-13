Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"

  resources :users, only: [:index, :edit, :update, :create]

  resources :items, only: [:new, :create] do
    post :edit
  end

end
