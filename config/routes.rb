# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Conditional root route based on user authentication status
  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  unauthenticated do
    root 'splash#index', as: :unauthenticated_root
  end

  get 'splash/index'

  resources :categories, only: [:index, :new, :create] do
    resources :transactions, only: [:index, :new, :create]
  end
end
