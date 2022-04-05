Rails.application.routes.draw do
  get "blog", to: "blog#index"

  get "/users", to: "users#show"
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]
end
