class Promotion < ActiveRecord::Base
  belongs_to :product
  attr_accessible :end, :percent, :start, :title, :product_id

  def active?
    self.start < DateTime.now && DateTime.now < self.end
  end

end
