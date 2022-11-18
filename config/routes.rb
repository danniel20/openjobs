Rails.application.routes.draw do
  resources :companies, only: [:new, :edit, :create, :update]
  resources :positions
  resources :applicants, only: [:index, :new, :create]

  devise_for :users
  root 'home#index'

  get "/vaga/:slug", action: :public_position, controller: :positions, as: :public_position
end
