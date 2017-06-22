Rails.application.routes.draw do
  root "statics#welcome"
  get "/help", to: "statics#help"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users, except: :new
end
