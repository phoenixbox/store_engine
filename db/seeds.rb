# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(username:"user", display_name:"user and user", email:"user@user.com", password:"user", password_confirmation:"user" )

blair = User.create!(username: "Blair Anderson", display_name:"blair",email:"blair@blair.com", password:"blair", password_confirmation:"blair", admin:1)

brad = User.create!(username: "Brad Sheehan", display_name:"brad",email:"brad@brad.com", password:"brad", password_confirmation:"brad", admin:1)

shane = User.create!(username: "Shane Rogers", display_name:"shane",email:"shane@shane.com", password:"shane", password_confirmation:"shane", admin:1)

frank = User.create!(username: "Franklin Webber",email:"demoXX+franklin@jumpstartlab.com", password:"password", password_confirmation:"password", admin:0)

jeff = User.create!(username: "Jeff Casimir", display_name:"j3",email:"demoXX+jeff@jumpstartlab.com", password:"password", password_confirmation:"password", admin:0)

steve = User.create!(username:"Steve Klabnik", display_name:"SkrilleX", email:"demoXX+steve@jumpstartlab.com", password:"password", password_confirmation:"password", admin:1 )

file = File.new('./doc/products_for_store_engine.csv')

CSV.foreach(file.path, headers: true) do |row|
  product = Product.find_by_id(row["id"]) || Product.new
  product.attributes = row.to_hash.slice(*Product.accessible_attributes)
  puts "loading #{product.title[0..10]}..."
  product.save!
end

puts "LOADED #{Product.all.count} products"
cart = Hash.new(0)
cart[1]=1
cart[2]=2
cart[3]=1
userlist = [blair, brad, shane, steve, frank, jeff, user] 
userlist.each_with_index do |user,i|
  user.create_cart(data: cart)
  order = Order.for_user(user)
  user.cart.destroy
end

cart = Hash.new(0)
cart[5]=2
cart[6]=1
cart[7]=2
userlist.each_with_index do |user,i|
  user.create_cart(data: cart)
  order = Order.for_user(user)
  user.cart.destroy
end

cart = Hash.new(0)
cart[5]=2
cart[6]=1
cart[7]=2
userlist.each_with_index do |user,i|
  user.create_cart(data: cart)
  order = Order.for_user(user)
  user.cart.destroy
end

order1 = Order.find_by_id(1)
order1.status = "pending"
order1.save!
puts "created order1 with line items"

order2 = Order.find_by_id(2)
order2.status = "cancelled"
order2.save!
puts "created order2 with line items"

order3 = Order.find_by_id(3)
order3.status = "pending"
order3.save!
puts "created order3 with line items"

order4 = Order.find_by_id(4)
order4.status = "cancelled"
order4.save!
puts "created order4 with line items"

order5 = Order.find_by_id(5)
order5.status = "paid"
order5.save!
puts "created order5 with line items"

order6 = Order.find_by_id(6)
order6.status = "shipped"
order6.save!
puts "created order6 with line items"

order7 = Order.find_by_id(7)
order7.status = "paid"
order7.save!
puts "created order7 with line items"

order8 = Order.find_by_id(8)
order8.status = "returned"
order8.save!
puts "created order8 with line items"

order9 = Order.find_by_id(9)
order9.status = "returned"
order9.save!
puts "created order9 with line items"

order10 = Order.find_by_id(10)
order10.status = "shipped"
order10.save!
puts "created order10 with line items"


puts "\n\nPlease run $ rake build:cat_photos"


#At least 10 sample orders, with at least two at each stage of fulfillment (pending, shipped, etc)
