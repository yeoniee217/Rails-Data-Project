class Customer < ApplicationRecord
  has_many :orders

  validates :name, :address, :phone_number, :email, presence: true
end
