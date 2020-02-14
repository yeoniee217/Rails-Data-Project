class AddOrderNumToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :order_num, :integer
  end
end
