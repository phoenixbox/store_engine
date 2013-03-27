require 'spec_helper'

describe Product do 
  context "viewing products" do

    it "should show one product" do 
      Product.create(title: "Nalgene Water Bottle", description:"a really strong water bottle", price:"12345", categories_list:"bottle")
      visit '/'
      expect( page ).to have_content "Nalgene Water Bottle"
    end

    it "should show all products" do 
      Product.create(title: "Macbook Air", description:"a really strong water bottle", price:"12345", categories_list:"computer")
      Product.create(title: "Pizza Box", description:"a really strong water bottle", price:"12345", categories_list:"pizza")
      visit root_path
      expect( page ).to have_content "Macbook Air"
      expect( page ).to have_content "Pizza Box"
    end

    it "product title should link to detail page" do 
      Product.create(title: "Nalgene Water Bottle", description:"a really strong water bottle", price:"12345", categories_list:"bottle")
      visit '/'
      expect( page ).to have_link "Nalgene Water Bottle"
    end

    it "link to detail page displays details" do
      Product.create(title: "Nalgene Water Bottle", description:"a really strong water bottle", price:"12345", categories_list:"bottle")
      visit '/'
      click_link "Nalgene Water Bottle"
      expect( page ).to have_content "a really strong water bottle"
    end

    it "should have link to categories" do
      visit root_path
      expect( page ).to have_link "Categories"
    end

    it "should create a new product" do
      visit new_product_path
      fill_in "product_title", :with => "ironing board"
      fill_in "product_price", :with => "100"
      fill_in "product_description", :with => "we do ironing boards well"
      click_button "Create Product"
      expect( page ).to have_content "ironing board"
    end

    it "should show the categories associated with the product" do 
      visit new_product_path
      fill_in "product_title", :with => "ironing board"
      fill_in "product_price", :with => "100"
      fill_in "product_description", :with => "we do ironing boards well"
      fill_in "product_categories_list", :with => "ironing,laundry"
      click_button "Create Product"
      expect( page ).to have_link "ironing"
      expect( page ).to have_link "laundry"
    end

    context "editing and updating" do
      let!(:product) { Product.create(title: "ironing board", price: "100", description:"we do ironing boards well") }

      it "product detail should have edit link" do
        visit product_path(product)
        expect( page ).to have_link "Edit Product"
      end

      it "should show the edit product page" do
        visit edit_product_path(product)
        expect(find_field('product_title').value).to eq "ironing board"
      end

      it "should change when updates are submitted" do 
        visit edit_product_path(product)
        fill_in 'product_description', :with => "Hermans Hideaway"
        click_button "Update Product"
        expect( page ).to have_content "Hermans Hideaway"
      end

      it "should have a delete button" do
        visit product_path(product)
        expect( page ).to have_link "Destroy"
      end

      it "should have a categories field" do 
        visit new_product_path
        expect( find_field("product_categories_list").value ).to eq ""
      end

    end

  end
end
