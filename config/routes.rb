Rails.application.routes.draw do
  root to: "articles#index"

  get "users/articles", to: "articles#index"

  resource :session, only: %i[new create destroy]
  resources :registrations, only: %i[new create]

  resources :articles, only: %i[index show]

  namespace :users do
    resource :me, only: %i[show edit update], controller: "me"
    resource :passwords, only: %i[edit update]
    resources :articles, only: %i[create] do
      resources :publications, only: %i[create destroy], module: :articles
    end
  end

  resolve("User") { %i[user] }
end
