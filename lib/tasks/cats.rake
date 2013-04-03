namespace :build do 
  desc "add photos to categories"
  task :cat_photos => :environment do 
    soft_storage = Category.find_by_name("soft-storage")
    soft_storage.update_attributes(photo_url:Product.find_by_model_number("SFT-02115").photo_url.to_s)
    puts "loading soft_storage category photo..."

    hangers = Category.find_by_name("hangers")
    hangers.update_attributes(photo_url:hangers.products.first.photo_url.to_s)
    puts "loading hangers category photo..."

    ironing_board_covers = Category.find_by_name("ironing-board-covers")
    ironing_board_covers.update_attributes(photo_url:ironing_board_covers.products[4].photo_url.to_s)
    puts "loading ironing_board_covers category photo..."

    kitchen_accessories = Category.find_by_name("kitchen-accessories")
    kitchen_accessories.update_attributes(photo_url:kitchen_accessories.products[1].photo_url.to_s)
    puts "loading kitchen_accessories category photo..."

    hampers = Category.find_by_name("hampers")
    hampers.update_attributes(photo_url:Products.find_by_model_number("HMP-02060").photo_url.to_s)
    puts "loading hampers category photo..."

    shelves = Category.find_by_name("shelves")
    shelves.update_attributes(photo_url:shelves.products[8].photo_url.to_s)
    puts "loading shelves category photo..."

    shelf = Category.find_by_name("shelf")
    shelf.update_attributes(photo_url:shelf.products.first.photo_url.to_s)
    puts "loading shelf category photo..."

    shelving = Category.find_by_name("shelving")
    shelving.update_attributes(photo_url:shelving.products.first.photo_url.to_s)
    puts "loading shelving category photo..."

    storage_accessories = Category.find_by_name("storage-accessories")
    storage_accessories.update_attributes(photo_url:storage_accessories.products.first.photo_url.to_s)
    puts "loading storage_accessories category photo..."

    trash_cans = Category.find_by_name("trash-cans")
    trash_cans.update_attributes(photo_url:trash_cans.products.first.photo_url.to_s)
    puts "loading trash_cans category photo..."

    carts = Category.find_by_name("carts")
    carts.update_attributes(photo_url:carts.products[2].photo_url.to_s)
    puts "loading carts category photo..."

    garment_racks = Category.find_by_name("garment-racks")
    garment_racks.update_attributes(photo_url:garment_racks.products[8].photo_url.to_s)
    puts "loading garment_racks category photo..."

    ironing_boards = Category.find_by_name("ironing-boards")
    ironing_boards.update_attributes(photo_url:products[1].photo_url.to_s)
    puts "loading ironing_boards category photo..."

    laundry_bag = Category.find_by_name("laundry-bag")
    laundry_bag.update_attributes(photo_url:laundry_bag.products[2].photo_url.to_s)
    puts "loading laundry_bag category photo..."

    laundry = Category.find_by_name("laundry")
    laundry.update_attributes(photo_url:laundry.products[14].photo_url.to_s)
    puts "loading laundry category photo..."

    drying = Category.find_by_name("drying")
    drying.update_attributes(photo_url:drying.products[24].photo_url.to_s)
    puts "loading drying category photo..."

    shoe_storage = Category.find_by_name("shoe-storage")
    shoe_storage.update_attributes(photo_url:shoe_storage.products.first.photo_url.to_s)
    puts "loading shoe_storage category photo..."

    laundry_sorters = Category.find_by_name("laundry-sorters")
    laundry_sorters.update_attributes(photo_url:laundry_sorters.products.first.photo_url.to_s)
    puts "loading laundry_sorters category photo..."

    laundry_centers = Category.find_by_name("laundry-centers")
    laundry_centers.update_attributes(photo_url:laundry_centers.products.first.photo_url.to_s)
    puts "loading laundry_centers category photo..."

    vacuum_storage = Category.find_by_name("vacuum-storage")
    vacuum_storage.update_attributes(photo_url:vacuum_storage.products.first.photo_url.to_s)
    puts "loading vacuum_storage category photo..."

    wardrobe = Category.find_by_name("wardrobe")
    wardrobe.update_attributes(photo_url:wardrobe.products.first.photo_url.to_s)
    puts "loading wardrobe category photo..."

    closets = Category.find_by_name("closets")
    closets.update_attributes(photo_url:closets.products.first.photo_url.to_s)
    puts "loading closets category photo..."

    tv_mounting_brackets  = Category.find_by_name("tv-mounting-brackets")
    tv_mounting_brackets .update_attributes(photo_url:tv_mounting_brackets .products.first.photo_url.to_s)
    puts "loading tv_mounting_brackets  category photo..."

    laundry_for_dummies = Category.find_by_name("laundry-for-dummies")
    laundry_for_dummies.update_attributes(photo_url:laundry_for_dummies.products.first.photo_url.to_s)
    puts "loading laundry_for_dummies category photo..."
  end
end
