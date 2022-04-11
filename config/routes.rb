Rails.application.routes.draw do
  root to: "blog#index"

  resource :blog, only: %i[index]
  resource :user, only: %i[new create show edit update]
  resource :session, only: %i[new create destroy]

  resolve("User") { %i[user] }
end
