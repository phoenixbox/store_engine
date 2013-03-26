class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title, :categories_list
  has_many :taggings
  has_many :categories, through: :taggings
  validates :title, :presence => true
  validates :price, :presence => true
  validates :description, :presence => true

  def categories_list
    categories.join(", ")
  end

  def categories_list=(cat_string)
    cat_names = cat_string.split(",").map{|s|s.strip.downcase}.uniq
    new_or_found_cats = cat_names.map{ |name|Category.find_or_create_by_name(name) }
    self.categories = new_or_found_cats
  end
end
