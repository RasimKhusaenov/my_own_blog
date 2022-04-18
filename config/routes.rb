Rails.application.routes.draw do
  root to: "articles#index"

  resources :articles, only: %i[new create index show] do
    resources :publications, only: %i[create destroy], module: :articles
  end

  resource :user, only: %i[show edit update] do
    resources :passwords, only: %i[new create], module: :users
    resources :registrations, only: %i[new create], module: :users
  end

  resource :session, only: %i[new create destroy]

  resolve("User") { %i[user] }
end
