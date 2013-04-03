class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title, :categories_list, :visible, :long_title, :long_description, :bullet1, :bullet2, :bullet3, :bullet4, :bullet5, :color, :asin, :model_number, :photo_url, :units, :cost_cents, :length, :width, :height, :weight, :upc

  has_many :taggings
  has_many :categories, through: :taggings
  belongs_to :line_item
  validates :title, :presence => true
  validates :price, :presence => true
  # validates :description, :presence => true

  def to_param
    "#{id} #{title}".parameterize
  end
  
  def self.landing_page
    array =[]
    # 0 blue cannisters
    array << Product.find_by_model_number("KCH-01312")
    # 1 dishes rack
    array << Product.find_by_model_number("KCH-01868")
    # 2 frog hamper
    array << Product.find_by_model_number("HMP-02058")
    # 3 Mini Soft Fabric  Storage Bin, Blue
    array << Product.find_by_model_number("SFT-02085")
    # 4 Stainless Steel Step Trash Can with Liner, Red
    array << Product.find_by_model_number("TRS-02228")
    # 5 Nested Woven Tote with Liner, Espresso Black
    array << Product.find_by_model_number("STO-02986")
    # 6 SHO-01604- Black Shoe Tubes
    array << Product.find_by_model_number("SHO-01604")
    # 7 SHO-01599- Deluxe Bamboo Shoe Shelf
    array << Product.find_by_model_number("SHO-01599")
    # 8 SFT-02063-Natural Canvas Soft Storage Box
    array << Product.find_by_model_number("SFT-02063")
    # 9 SFT-01248 - Drawers For Hanging Organizer, Black
    array << Product.find_by_model_number("SFT-01248")
    # 10 KCH-02154 - Steel Mesh Cutlery Utensil Organizer, Silver
    array << Product.find_by_model_number("KCH-02154")
    # 11 DRY-01390 -Plastic Clothespins
    array << Product.find_by_model_number("DRY-01390")
    # 12 KCH-01080 - Bamboo Kitchen Utensil Caddy
    array << Product.find_by_model_number("KCH-01080")
    array
  end

  def margin
    ((price*1.0 - cost_cents*1.0)/(price*1.0)*100).round(2)
  end

  def categories_list
    categories.join(", ")
  end

  def categories_list=(cat_string)
    cat_names = cat_string.split(",").map{|s|s.strip.downcase}.uniq
    new_or_found_cats = cat_names.map{ |name|Category.find_or_create_by_name(name) }
    self.categories = new_or_found_cats
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      product = find_by_id(row["id"]) || new
      product.attributes = row.to_hash.slice(*accessible_attributes)
      product.save!
    end
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
