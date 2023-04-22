Rails.application.routes.draw do
  root to: "products#index"
  get "products", to: "products#index"
  get "products/new", to: "products#new"
  post "products", to: "products#create"
end
