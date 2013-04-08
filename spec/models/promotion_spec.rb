require 'spec_helper'

describe Promotion do
  context "#active?" do
    it "should be true if today is between start and end" do 
      product = Product.create!(title:"product name", long_description:"product description", price: 12345, cost_cents: 6789, page_views:0)
      promo = product.promotions.create!(title:"product promo", percent:30, start:Date.yesterday, end:Date.tomorrow)
      expect( promo.active? ).to be
    end

    it "should be false if today is after the end-date" do 
      product = Product.create!(title:"product name", long_description:"product description", price: 12345, cost_cents: 6789, page_views:0)
      promo = product.promotions.create!(title:"product promo", percent:30, start:Date.yesterday, end:Date.yesterday)
      expect( promo.active?).to_not be
    end
  end
end
