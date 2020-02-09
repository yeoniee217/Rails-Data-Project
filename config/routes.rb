Rails.application.routes.draw do
  root to: 'products#index'

  get "products/:id", to: 'products#show', id: /\d+/, as: "product" # product_path
end
