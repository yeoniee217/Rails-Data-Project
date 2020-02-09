Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  root to: 'products#index'

  get "products/:id", to: 'products#show', id: /\d+/, as: "product" # product_path
end
