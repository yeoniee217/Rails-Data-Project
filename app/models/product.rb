class Product < ApplicationRecord
  # belongs_to :order
  has_many :orders

  validates :name, :price, presence: true
  validates :stock_quantity, numericality: { only_integer: true }
end
