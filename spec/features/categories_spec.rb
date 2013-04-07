require 'spec_helper'

describe "Categories" do 
  context "viewing categories" do 

    xit "should show the categories" do 
      Category.create(name:'tag1')
      visit '/categories'
      expect( page ).to have_content "Tag1"
    end

    it "product title should link to detail page" do 
      Category.create(name: "tag1")
      visit categories_path
      expect( page ).to have_link "Tag1"
    end
  end

  context "viewing category" do

    it "should show filtered products page" do
      a = Product.create(title: "Nalgene", long_description: "Best Water Bottle Ever", price: 12345, cost_cents: 5670)
      a.categories.create(name: "tag1")
      visit categories_path
      click_link "Tag1"
      expect( page ).to have_content "1 items"
    end

  end

end
