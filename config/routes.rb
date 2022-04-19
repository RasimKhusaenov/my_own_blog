Rails.application.routes.draw do
  root to: "articles#index"

  resource :session, only: %i[new create destroy]
  resources :registrations, only: %i[new create]

  resource :user, only: %i[show edit update]

  resources :articles, only: %i[index show]

  namespace :users do
    resource :passwords, only: %i[edit update]
    resources :articles, only: %i[new create] do
      resources :publications, only: %i[create destroy], module: :articles
    end
  end

  resolve("User") { %i[user] }
end
