Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy', as: :signout
  end

  resources :users, only: %i[ show edit update ]
  resources :tasks
  
  root "users#show"
end
