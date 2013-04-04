class Promotion < ActiveRecord::Base
  belongs_to :product
  attr_accessible :end, :percent, :start, :title, :product_id

  def active?
    self.start < DateTime.now && DateTime.now < self.end
  end

  # def self.for_category(cat)
  #   cat.products.each do |product|

  #   end
  # end
end
