Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[ show edit update ]
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#show"

end
