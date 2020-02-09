class Customer < ApplicationRecord
  # columns: id, name, address, phone_number, email
  has_many :orders

  validates :name, :address, :phone_number, :email, presence: true
  validates :email, uniqueness: true
end
