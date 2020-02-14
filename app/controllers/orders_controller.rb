class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  # Rails automatically loads the associated view:
  #  app/views/orders/index.html.erb
  # The @orders variable is shared with the view.

  def show
    @order = Order.find(params[:id])
  end
end
