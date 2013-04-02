require 'spec_helper'

describe "Categories" do 
  context "viewing categories" do 

    it "should show the categories" do 
      Category.create(name:'tag1')
      visit '/categories'
      expect( page ).to have_content "tag1"
    end

    it "product title should link to detail page" do 
      Category.create(name: "tag1")
      visit categories_path
      expect( page ).to have_link "tag1"
    end
  end

  context "viewing category" do

    it "should show filtered products page" do
      a = Product.create(title: "Nalgene", description: "Best Water Bottle Ever", price: "1234")
      a.categories.create(name: "tag1")
      visit categories_path
      click_link "tag1"
      expect( page ).to have_content "1 items"
    end

  end

end
