Rails.application.routes.draw do
  # get "order_products/index"
  # get "order_products/show"
  root to: "products#index"

  # get 'customers', to: 'customers#index'
  # get 'orders', to: 'orders#index'

  # get "products/:id", to: 'products#show', id: /\d+/, as: "product" # product_path
  # get "orders/:id", to: 'orders#show', id: /\d+/, as: "order" # order_path
  # get "customers/:id", to: 'customers#show', id: /\d+/, as: "customer" # customer_path

  resources "products", only: %i[index show]
  # GET /products     => products#index
  # GET /products/:id => products#show
  resources "orders", only: %i[index show]
  resources "customers", only: %i[index show]
  resources "categories", only: %i[index show]
  resources "order_products", only: %i[index show]
end
