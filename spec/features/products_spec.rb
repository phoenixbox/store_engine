require 'spec_helper'

describe Product do 
  context "viewing products" do

    it "should show one product" do 
      Product.create(title: "Nalgene Water Bottle", long_description:"a really strong water bottle", price:"12345", categories_list:"bottle")
      visit '/'
      expect( page ).to have_content "Nalgene Water Bottle"
    end

    it "should show all products" do 
      Product.create(title: "Macbook Air", long_description:"a really strong water bottle", price:"12345", categories_list:"computer")
      Product.create(title: "Pizza Box", long_description:"a really strong water bottle", price:"12345", categories_list:"pizza")
      visit root_path
      expect( page ).to have_content "Macbook Air"
      expect( page ).to have_content "Pizza Box"
    end

    it "product title should link to detail page" do 
      Product.create(title: "Nalgene Water Bottle", long_description:"a really strong water bottle", price:"12345", categories_list:"bottle")
      visit '/'
      expect( page ).to have_link "Nalgene Water Bottle"
    end

    it "link to detail page displays details" do
      Product.create(title: "Nalgene Water Bottle", long_description:"a really strong water bottle", price:"12345", categories_list:"bottle", visible: true)

      visit '/'
      click_link "Nalgene Water Bottle"
      expect( page ).to have_content "a really strong water bottle"
    end

    it "should have link to categories" do
      visit root_path
      expect( page ).to have_link "Categories"
    end 

    it "should not be visible when product is retired" do
      Product.create(title: "Nalgene Water Bottle", long_description:"a really strong water bottle", price:"12345", categories_list:"bottle", visible: false)
      visit root_path
      expect( page ).to_not have_link "Nalgene Water Bottle"
    end
  end
end
