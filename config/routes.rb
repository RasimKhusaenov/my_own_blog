Rails.application.routes.draw do
  root to: "articles#index"

  resources :articles, only: %i[new create index show] do
    resources :publications, only: %i[create], controller: "articles/publications"
  end

  resource :user, only: %i[new create show edit update]
  resource :session, only: %i[new create destroy]

  resolve("User") { %i[user] }
end
