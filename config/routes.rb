Rails.application.routes.draw do
  root to: "articles#index"

  resources :article, only: %i[new create index show]
  resource :user, only: %i[new create show edit update]
  resource :session, only: %i[new create destroy]

  resolve("User") { %i[user] }
end
