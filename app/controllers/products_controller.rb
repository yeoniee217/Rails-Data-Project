class ProductsController < ApplicationController
  # GET /
  def index
    @products = Product.all
  end

  # GET /products/:id
  def show
    @product = Product.find(params[:id])
  end
end
