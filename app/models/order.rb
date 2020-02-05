class Order < ApplicationRecord
  belongs_to :customer # has customer_id column
end
