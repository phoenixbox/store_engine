class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title, :categories_list, :visible, :long_title, :long_description, :bullet1, :bullet2, :bullet3, :bullet4, :bullet5, :color, :asin, :model_number, :photo_url, :units, :cost_cents, :length, :width, :height, :weight, :upc

  has_many :taggings
  has_many :categories, through: :taggings
  belongs_to :line_item
  validates :title, :presence => true
  validates :price, :presence => true
  # validates :description, :presence => true

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

end
