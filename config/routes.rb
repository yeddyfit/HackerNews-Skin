Rails.application.routes.draw do
  devise_for :users
  get "/", to: "posts#index", as: "root"
  # get "/:id", to: "posts#show", as: "post"
end
