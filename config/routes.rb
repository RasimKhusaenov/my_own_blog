Rails.application.routes.draw do
  get "blog", to: "blog#index"

  resource :user, only: %i[new create show]
  resource :session, only: %i[new create destroy]
end
