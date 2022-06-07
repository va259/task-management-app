Rails.application.routes.draw do
  resources :users, only: %i[ show edit update ]
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tasks#index"
end
