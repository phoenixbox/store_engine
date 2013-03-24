require 'spec_helper'

describe "Shopping Cart" do 

  context "views" do 
    it "should be on the index page" do 
      visit root_path
      expect( page ).to have_content "Shopping Cart"
    end

    let!(:product) { Product.create(title: "ironing board", price: "100", description:"we do ironing boards well", :categories_list => "laundry") }
   
    it "should persist on Category#index" do
      visit product_path(product)
      click_link "Add to Cart"
      visit categories_path
      within( "#shopping_cart" ) do 
        expect( page ).to have_content product.title
      end
    end

    it "should persist on Category#show" do
      visit product_path(product)
      click_link "Add to Cart"
      target_category = Category.find_by_name('laundry')
      visit category_path(target_category)
      within( "#shopping_cart" ) do
        expect( page ).to have_content product.title
      end
    end

    it "should persist on Product#show" do
      visit product_path(product)
      click_link "Add to Cart"
      visit product_path(product)
      within( "#shopping_cart" ) do 
        expect( page ).to have_content product.title
      end
    end 

    it "should persist on Product#index" do
      visit product_path(product)
      click_link "Add to Cart"
      visit products_path
      within( "#shopping_cart" ) do 
        expect( page ).to have_content product.title
      end
    end

    it "should add content to shopping_cart" do
      visit product_path(product)
      click_link "Add to Cart"
      within( "#shopping_cart" ) do 
        expect( page ).to have_content product.title
      end
    end

    it "increase quantity on + click" do
      visit product_path(product)
      click_link "Add to Cart"
      visit products_path
      click_link("increase_count")
      within( "#shopping_cart" ) do 
        expect( page ).to have_content "Quantity:2"
      end
    end

    it "decrease quantity on - click" do
      visit product_path(product)
      click_link "Add to Cart"
      visit products_path
      click_link("decrease_count")
      within( "#shopping_cart" ) do 
        expect( page ).to have_content "Total Items: 0"
      end
    end

  end
end
