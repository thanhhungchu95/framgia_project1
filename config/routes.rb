Rails.application.routes.draw do
  root "statics#welcome"
  get "/help", to: "statics#help"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, except: :new
end
