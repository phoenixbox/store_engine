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




#At least 10 sample orders, with at least two at each stage of fulfillment (pending, shipped, etc)
