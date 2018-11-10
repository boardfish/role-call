# frozen_string_literal: true

Rails.application.routes.draw do
  resources :roles
  resources :win_condition_associations
  resources :win_conditions
  resources :game_sessions
  resources :games do
    get 'join', on: :member
    resources :game_sessions
  end
  resources :users do
    get 'authenticate', on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
