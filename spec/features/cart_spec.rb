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

    it "should have a checkout button" do 
      visit product_path(product)
      click_link "Add to Cart"
      within( "#shopping_cart" ) do 
        expect( page ).to have_link "Checkout"
      end
    end

  end #--- view context

  context "cart review" do 

    let!(:product) { Product.create(title: "ironing board", price: "100.12", description:"we do ironing boards well", :categories_list => "laundry") }

    it "should have a cart routes" do
      visit product_path(product)
      click_link "Add to Cart"
      click_link "Checkout"
      expect( current_path ).to eq cart_path
    end

    it "should list cart contents" do
      visit product_path(product)
      click_link "Add to Cart"
      click_link "Checkout"
      expect( page ).to have_content product.title
    end

    it "should not have a checkout link" do
      visit product_path(product)
      click_link "Add to Cart"
      click_link "Checkout"
      expect( page ).to_not have_link "Checkout"
      expect( page ).to_not have_selector "#shopping_cart"
    end

    it "should link to product detail page" do 
      visit product_path(product)
      click_link "Add to Cart"
      click_link "Checkout"
      expect( page ).to have_link "ironing board"
    end

    it "should show item price" do 
      visit product_path(product)
      click_link "Add to Cart"
      click_link "Checkout"
      expect( page ).to have_content "$100.12"
    end

    it "should have subtotal of 2 items in cart" do
      visit product_path(product)
      click_link "Add to Cart"
      click_link "Checkout"
      click_link "+"
      within( "#cart_subtotal" ) do 
        expect( page ).to have_content "$200.24"
      end
    end

    it "should have subtotal of 3 items in cart" do
      visit product_path(product)
      click_link "Add to Cart"
      click_link "Checkout"
      click_link "+"
      click_link "+"
      within( "#cart_subtotal" ) do 
        expect( page ).to have_content "$300.36"
      end
    end

    it "should have a remove button" do
      visit product_path(product)
      click_link "Add to Cart"
      click_link "Checkout"
      expect( page ).to have_button "Remove"
    end

    it "should remove product" do
      visit product_path(product)
      click_link "Add to Cart"
      click_link "Checkout"
      click_button "Remove"
      expect( page ).to have_content "0 items"
    end

    it "should have a pay now link" do
      visit product_path(product)
      click_link "Add to Cart"
      visit cart_path
      expect( page ).to have_link "Buy Now"
    end

    it "unauthenticated users should be redirected to login" do
      visit product_path(product)
      click_link "Add to Cart"
      visit cart_path
      click_link "Buy Now"
      expect( page ).to have_content "Username"
      expect( page ).to have_content "Password"
    end

    it "should show flash message for unauthenticated users" do
      visit product_path(product)
      click_link "Add to Cart"
      visit cart_path
      click_link "Buy Now"
      expect(page).to have_content "Cannot purchase"
    end
  
  end

  context "cart persists through login/logout" do 
    let!(:product) { Product.create(title: "ironing board", price: "100.12", description:"we do ironing boards well", :categories_list => "laundry") }
    let!(:user) { User.create(email:"admin@admin.com", username:"admin", password:"admin", password_confirmation:"admin")}
    
    it "shows products before and after logout/login" do
      visit login_path
      fill_in "username", :with => "admin"
      fill_in "password", :with => "admin"
      click_button "Login"

      visit product_path(product)
      click_link "Add to Cart"
      click_link "logout"
      
      visit login_path
      fill_in "username", :with => "admin"
      fill_in "password", :with => "admin"
      click_button "Login"
      visit cart_path

      expect(page).to have_content "ironing board"
      expect(page).to have_content "we do ironing boards well"
      expect(current_path).to eq "/cart"
    end
  end
end






