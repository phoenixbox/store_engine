class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  attr_accessible :quantity, :unit_price_cents, :product_id
end
