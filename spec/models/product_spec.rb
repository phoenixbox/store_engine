require 'spec_helper'

describe Product do 
  context "When it has a name, description, price" do 
    let(:subject) { Product.new(title:"productname", long_description:"productdescription", price: 12345, cost_cents: 6789)}

    it "is valid" do 
      expect( subject ).to be_valid
    end

    it "should not be valid wihout a title" do
      subject.title = nil
      expect( subject ).to be_invalid
    end

    it "should not be valid wihout a price" do
      subject.price = nil
      expect( subject ).to be_invalid
    end

    it "should not be valid wihout a cost_cents" do
      subject.cost_cents = nil
      expect( subject ).to be_invalid
    end
  end

  describe "#increase_view_count" do
    it "should add to the view count" do 
      product = Product.create!(title:"product name", long_description:"product description", price: 12345, cost_cents: 6789, page_views:0)
      before = product.page_views
      product.increase_view_count
      expect( product.page_views ).to eq before+1
    end
  end

  describe "#discount?" do 
    it "should return false if a discount does not exist." do 
      product = Product.create!(title:"product name", long_description:"product description", price: 12345, cost_cents: 6789, page_views:0)
      expect( product.discount? ).to_not be   
    end

    it "should return true if a discount does exist." do 
      product = Product.create!(title:"product name", long_description:"product description", price: 12345, cost_cents: 6789, page_views:0)
      product.promotions.create!(title:"product promo", percent:30, start:Date.yesterday, end:Date.tomorrow)
      expect( product.discount? ).to be   
    end
  end
  
  describe "#discount" do
    it "should return the discount as 0 if it doesn't exist" do 
      product = Product.create!(title:"product name", long_description:"product description", price: 12345, cost_cents: 6789, page_views:0)
      expect( product.discount ).to eq 0
    end

    it "should return the discount integer" do 
      product = Product.create!(title:"product name", long_description:"product description", price: 12345, cost_cents: 6789, page_views:0)
      product.promotions.create!(title:"product promo", percent:30, start:Date.yesterday, end:Date.tomorrow)
      expect( product.discount ).to eq 30
    end  
  end
  
  describe "#discounted_price" do 
    it "should show discounted price if a discount exists" do 
      product = Product.create!(title:"product name", long_description:"product description", price: 12345, cost_cents: 6789, page_views:0)
      product.promotions.create!(title:"product promo", percent:30, start:Date.yesterday, end:Date.tomorrow)
      expect( product.discounted_price ).to eq 8641.5
    end

    it "should show regular price when no discount" do 
      product = Product.create!(title:"product name", long_description:"product description", price: 12345, cost_cents: 6789, page_views:0)
      expect( product.discounted_price ).to eq 12345
    end
  end

  describe "#margin" do 
    it "should display the margin for an item" do 
      product = Product.create!(title:"product name", long_description:"product description", price: 12345, cost_cents: 6789, page_views:0)
      expect( product.margin ).to eq 45.01
    end
  end

  describe "#to_param" do 
    it "should add the title to the url" do 
      product = Product.create!(title:"product name", long_description:"product description", price: 12345, cost_cents: 6789, page_views:0)
      expect( product.to_param ).to eq "1-product-name" 
    end
  end

  describe ".landing_page" do
    it "should show some shit"
  end

  describe ".search" do 
    it "should return 'all' if no params are sent" do
      product = Product.create!(title:"product name", long_description:"product description", price: 12345, cost_cents: 6789, page_views:0)
      expect( Product.search("product")).to eq [product]
    end
  end
end
