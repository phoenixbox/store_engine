# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

blair = User.create!(username: "Blair Anderson", display_name:"blair",email:"blair@blair.com", password:"blair", password_confirmation:"blair", admin:1)

brad = User.create!(username: "Brad Sheehan", display_name:"brad",email:"brad@brad.com", password:"brad", password_confirmation:"brad", admin:1)

shane = User.create!(username: "Shane Rogers", display_name:"shane",email:"shane@shane.com", password:"shane", password_confirmation:"shane", admin:1)

frank = User.create!(username: "Franklin Webber",email:"demoXX+franklin@jumpstartlab.com", password:"password", password_confirmation:"password", admin:0)

jeff = User.create!(username: "Jeff Casimir", display_name:"j3",email:"demoXX+jeff@jumpstartlab.com", password:"password", password_confirmation:"password", admin:0)

steve = User.create!(username:"Steve Klabnik", display_name:"SkrilleX", email:"demoXX+steve@jumpstartlab.com", password:"password", password_confirmation:"password", admin:1 )

soft_storage = Category.find_by_name("soft-storage")
soft_storage.update_attributes(photo_url:soft_storage.products.first.photo_url)

hangers = Category.find_by_name("hangers")
hangers.update_attributes(photo_url:hangers.products.first.photo_url)

ironing_board_covers = Category.find_by_name("ironing-board-covers")
ironing_board_covers.update_attributes(photo_url:ironing_board_covers.products.first.photo_url)

kitchen_accessories = Category.find_by_name("kitchen-accessories")
kitchen_accessories.update_attributes(photo_url:kitchen_accessories.products.first.photo_url)

hampers = Category.find_by_name("hampers")
hampers.update_attributes(photo_url:hampers.products.first.photo_url)

shelves = Category.find_by_name("shelves")
shelves.update_attributes(photo_url:shelves.products.first.photo_url)

shelf = Category.find_by_name("shelf")
shelf.update_attributes(photo_url:shelf.products.first.photo_url)

shelving = Category.find_by_name("shelving")
shelving.update_attributes(photo_url:shelving.products.first.photo_url)

storage_accessories = Category.find_by_name("storage-accessories")
storage_accessories.update_attributes(photo_url:storage_accessories.products.first.photo_url)

trash_cans = Category.find_by_name("trash-cans")
trash_cans.update_attributes(photo_url:trash_cans.products.first.photo_url)

carts = Category.find_by_name("carts")
carts.update_attributes(photo_url:carts.products.first.photo_url)

garment_racks = Category.find_by_name("garment-racks")
garment_racks.update_attributes(photo_url:garment_racks.products.first.photo_url)

ironing_boards = Category.find_by_name("ironing-boards")
ironing_boards.update_attributes(photo_url:ironing_boards.products.first.photo_url)

laundry_bag = Category.find_by_name("laundry-bag")
laundry_bag.update_attributes(photo_url:laundry_bag.products.first.photo_url)

laundry = Category.find_by_name("laundry")
laundry.update_attributes(photo_url:laundry.products.first.photo_url)

drying = Category.find_by_name("drying")
drying.update_attributes(photo_url:"https://s3.amazonaws.com/store_engine/small/DRY-01107_450px.jpg")

shoe_storage = Category.find_by_name("shoe-storage")
shoe_storage.update_attributes(photo_url:"https://s3.amazonaws.com/store_engine/small/SHO-01171_450px.jpg")

laundry_sorters = Category.find_by_name("laundry-sorters")
laundry_sorters.update_attributes(photo_url:"https://s3.amazonaws.com/store_engine/small/SRT-01196_450px.jpg")

laundry_centers = Category.find_by_name("laundry-centers")
laundry_centers.update_attributes(photo_url:"https://s3.amazonaws.com/store_engine/small/SRT-01235_450px.jpg")

vacuum_storage = Category.find_by_name("vacuum-storage")
vacuum_storage.update_attributes(photo_url:"https://s3.amazonaws.com/store_engine/small/VAC-01378_450px.jpg")

wardrobe = Category.find_by_name("wardrobe")
wardrobe.update_attributes(photo_url:"https://s3.amazonaws.com/store_engine/small/WRD-02124_450px.jpg")

closets = Category.find_by_name("closets")
closets.update_attributes(photo_url:"https://s3.amazonaws.com/store_engine/small/WRD-01272_450px.jpg")

tv_mounting_brackets  = Category.find_by_name("tv-mounting-brackets")
tv_mounting_brackets .update_attributes(photo_url:"https://s3.amazonaws.com/store_engine/small/BRK-01508_450px.jpg")

laundry_for_dummies = Category.find_by_name("laundry-for-dummies")
laundry_for_dummies.update_attributes(photo_url:"https://s3.amazonaws.com/store_engine/small/LDY-01427_450px.jpg")




#At least 10 sample orders, with at least two at each stage of fulfillment (pending, shipped, etc)
