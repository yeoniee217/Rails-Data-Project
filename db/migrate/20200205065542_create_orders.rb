class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.datetime :order_date

      # customer_id can't be nil(implicit validation in migration file, compared to model)
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
