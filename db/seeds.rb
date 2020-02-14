# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv" # have to specify??
require "json"
require "net/http"

OrderProduct.destroy_all
Order.destroy_all
Product.destroy_all
Customer.destroy_all
Category.destroy_all

aisles_file_name = "vendor/instacart_2017_05_01/aisles.csv"
products_file_name = "vendor/instacart_2017_05_01/products.csv"
# puts File.join Rails.root, "vendor/instacart_2017_05_01/products.csv"

aisles_json = CSV.read(aisles_file_name, headers: true).map(&:to_hash)
products_json = CSV.read(products_file_name, headers: true).map(&:to_hash)

num_of_customers = rand(100..130)
customers_url = "https://uinames.com/api/?ext&amount=#{num_of_customers}"
customers_response = Net::HTTP. get(URI(customers_url))
customers_data = JSON.parse(customers_response)

aisles_json.each do |aisle_data|
  category = Category.create(name: aisle_data["aisle"].capitalize)

  next unless category.persisted?

  products_json[0..2500].each do |product_data|
    if aisle_data["aisle_id"] == product_data["aisle_id"]
      category.products.create(name: product_data["product_name"], price: Faker::Commerce.price, stock_quantity: Faker::Number.non_zero_digit)
    end
  end
end

# populate products
# products_json[0..50].each do |product_data|
#   Product.create(name: product_data["product_name"], price: Faker::Commerce.price, stock_quantity: Faker::Number.non_zero_digit)
#   # add review here
# end

# populate customers with orders
order_num = 1
customers_data.each do |customer_data|
  customer = Customer.create(name:         customer_data["name"],
                             address:      Faker::Address.full_address,
                             phone_number: customer_data["phone"],
                             email:        customer_data["email"])

  next unless customer.persisted?

  num_of_orders = rand(2..6)
  num_of_orders.times do
    order = customer.orders.create(order_num: order_num, order_date: Faker::Date.between(from: 3.year.ago, to: Date.today))
    next unless order.persisted?

    num_of_products = 5
    product_offset = rand(Product.count..Product.count - num_of_products)
    products = Product.offset(product_offset).limit(num_of_products)
    random_products = products.sample(rand(2..5))

    random_products.each do |product|
      order.order_products.create(order: order, product: product)
    end

    order_num += 1
  end
end

# num_of_orders =
# orders = Order.all
# orders.each do |order|
#   products = Product.all
#   # random_num = rand(5)
#   products.each do |product|
#     OrderProduct.create(order: order, product: product)
#   end
# end

puts "Created #{Category.count} aisles."
puts "Created #{Product.count} products."
puts "Created #{Customer.count} customers."
puts "Created #{Order.count} orders."
puts "Created #{OrderProduct.count} OrderProducts."
