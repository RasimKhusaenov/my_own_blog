# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "blog", to: "blog#index"
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]
end
