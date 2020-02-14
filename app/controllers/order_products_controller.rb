class OrderProductsController < ApplicationController
  def index
    @order_products = OrderProduct.all
  end

  def show
    @order_product = OrderProduct.find(params[:id])
  end
end
