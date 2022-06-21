Rails.application.routes.draw do
  get "pages/about"

  root to: "articles#index"

  get "users/articles", to: "articles#index"

  resource :session, only: %i[new create destroy]
  resources :registrations, only: %i[new create]
  resource :password_reset, only: %i[new create edit update]

  resources :articles, only: %i[index show]
  resource :feedback, only: %i[new create]
  resources :companies, only: %i[] do
    resources :registrations, only: %i[new create], module: :companies
  end

  namespace :users do
    resource :comment, only: %i[create]
    resource :company, only: %i[new create]
    resource :me, only: %i[show edit update], controller: "me"
    resource :passwords, only: %i[edit update]
    resources :articles, only: %i[create] do
      resources :publications, only: %i[create destroy], module: :articles
    end
  end

  resolve("User") { %i[user] }
end
