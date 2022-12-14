Rails.application.routes.draw do
  constraints subdomain: Company::SUBDOMAIN_REGEXP do
    root to: "companies#show", as: "company_root"
  end

  root to: "articles#index"

  get "pages/about"
  get "users/articles", to: "articles#index"
  get "/articles", to: redirect("/")

  resource :session, only: %i[new create destroy]
  resources :registrations, only: %i[new create]
  resource :password_reset, only: %i[new create edit update]

  resources :articles, only: %i[index show]
  resource :feedback, only: %i[new create]

  namespace :users do
    resource :company, only: %i[new create]
    resource :me, only: %i[show edit update], controller: "me"
    resource :passwords, only: %i[edit update]
    resources :articles, only: %i[new create edit update destroy] do
      resources :publications, only: %i[create destroy], module: :articles
      resources :comments, only: %i[create]
    end
  end

  resolve("User") { %i[user] }
end
