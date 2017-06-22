Rails.application.routes.draw do
  root "statics#welcome"
  get "/help", to: "statics#help"
end
