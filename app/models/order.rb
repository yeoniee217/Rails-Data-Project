class Order < ApplicationRecord
  # columns: id, order_date, customer_id
  belongs_to :customer # has customer_id column
  has_many :products

  validates :order_date, presence: true
  # The FK(customer_id) is also required. (implicit validation - ref to migration file for orders table)
end
