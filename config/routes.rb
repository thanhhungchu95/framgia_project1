Rails.application.routes.draw do
  root "statics#welcome"
  get "/help", to: "statics#help"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
