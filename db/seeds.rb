# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'



# Faker::Number.non_zero_digit

puts "Cleaning database..."
Product.destroy_all
Category.destroy_all
Vendor.destroy_all
User.destroy_all
Order.destroy_all
OrderItem.destroy_all
Review.destroy_all
Cart.destroy_all
CartItem.destroy_all


# sku = [ ('a'…'z').to_a, ('A'…'Z').to_a, (0…9).to_a ].flatten

10.times do

puts "Creating categories..."
category = Category.new(
  name: Faker::Commerce.department(max: 1, fixed_amount: true),
  description: Faker::Commerce
)
category.save!

puts "Creating vendors..."

vendor = Vendor.new(
  name:Faker::Creature::Animal.name,
  description: Faker::ChuckNorris.fact
)
vendor.save!
  
puts "Creating products..."
product = Product.new(
  name: Faker::Games::Pokemon.name,
  description: Faker::Games::Pokemon.move,
  price: "Faker::Commerce.price",
  sku: Faker::Code.nric,
  category: category,
  vendor: vendor
)
product.save!

puts "Creating users..."
user = User.new(
  username: Faker::Internet.username, 
  password: Faker::Internet.password,
  first_name: Faker::Name.first_name,  
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  # address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
  mobile: Faker::PhoneNumber.cell_phone,
)
user.save!


puts "Creating adresses..."
address = Address.new(
  user: user,
  address_line1: Faker::Address.street_address,
  city: Faker::Address.city,
  postal_code: Faker::Address.zip_code,
  country: Faker::Address.country
)
address.save!

puts "Creating orders..."
order = Order.new(
  user: user,
  status: rand(0..4)
)
order.save!

puts "Creating order items..."
order_item = OrderItem.new(
order: order,
product: product,
quantity: rand(0..3)
)
order_item.save!


puts "Creating reviews..."
review = Review.new(
  user: user,
  product: product,
  title: Faker::Hacker.adjective,
  rating: Faker::Number.between(from: 1, to: 5),
  content: Faker::Lorem.paragraph 
)
review.save!

puts "Creating cart..."
cart = Cart.new(
  user: user,
  total: 10
)
cart.save!

puts "Creating cart items..."
cart_item = CartItem.new(
  cart: cart,
  product: product,
  quantity: rand(0..3)
)
cart_item.save!
end







# dishoom = { name: "Dishoom", address: "7 Boundary St, London E2 7JE", stars: 5 }
# pizza_east =  { name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ", stars: 4 }

# [ dishoom, pizza_east ].each do |attributes|
#   restaurant = Restaurant.create!(attributes)
#   puts "Created #{restaurant.name}"
# end
puts "Finished!"