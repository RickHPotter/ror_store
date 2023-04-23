Rails.application.routes.draw do
  root to: "products#index"
  get "products/search", to: "products#search", as: :search_product
  resources :products, only: %i[index new create edit destroy]
  # get "products", to: "products#index"
  # get "products/new", to: "products#new"
  # post "products", to: "products#create"
  # get "products/:id/edit", to: "products#edit"
  # delete "products/:id/delete", to: "products#destroy", as: :product
end
