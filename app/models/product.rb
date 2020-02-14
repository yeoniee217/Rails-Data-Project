class Product < ApplicationRecord
  # columns: id, name, price, stock_quantity
  belongs_to :category
  has_many :order_products
  has_many :orders, through: :order_products

  validates :name, :price, presence: true
  validates :stock_quantity, numericality: { only_integer: true }
end
