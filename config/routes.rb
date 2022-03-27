# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "blog", to: "blog#index"

  get "/users", to: "users#show"
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]
end
