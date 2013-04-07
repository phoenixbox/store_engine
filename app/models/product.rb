class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title, :categories_list, :visible, :long_title, :long_description, :bullet1, :bullet2, :bullet3, :bullet4, :bullet5, :color, :asin, :model_number, :photo_url, :units, :cost_cents, :length, :width, :height, :weight, :upc

  has_many :taggings
  has_many :categories, through: :taggings
  has_many :promotions
  belongs_to :line_item
  validates :title, :presence => true
  validates :price, :presence => true
  validates :cost_cents, :presence => true

  # validates :description, :presence => true

  def increase_view_count
    view_count = self.page_views
    self.page_views = view_count+1
    self.save
  end

  def discount
    if promotions.any?(&:active?)
      promotions.find(&:active?).percent
    else
      0
    end
  end

  def discounted_price
    (1-(discount/100.0))*price
  end

  def discount?
    if promotions.any?(&:active?)
      true
    else
      false
    end
  end

  def to_param
    "#{id} #{title}".parameterize
  end
  
  def self.landing_page
    result = Product.all.find_all(&:discount?) || result = []
    while result.count < 12
      if product = Product.find_by_id((1..Product.all.size).to_a.sample)
        result << product
      else
        result << Product.first
      end
    end
    if result.all?(&:nil?)
      return []
    else
      return result.sort_by{|p|-p.discount}
    end
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
