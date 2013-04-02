require 'spec_helper'

describe "order page" do

  context "while showing current order" do

    def user_logs_in
      visit login_path
      fill_in "username", :with => "user@user.com"
      fill_in "password", :with => "user"
      click_button "Login"
    end

    let!(:product) { Product.create(title: "ironing board", price: "100.12", description:"we do ironing boards well", :categories_list => "laundry") }
    let!(:user) { User.create(email:"user@user.com", username:"user", password:"user", password_confirmation:"user")}
    let!(:user2) { User.create(email:"notuser@user.com", username:"notuser", password:"notuser", password_confirmation:"notuser")}

    it "should include the items" do
      user_logs_in
      visit product_path(product)
      click_link "Add to Cart"
      visit cart_path
      click_link "Checkout"
      expect( current_path ).to eq '/orders/1'
    end

    it "should not be visible to any other users" do 
      user_logs_in
      visit product_path(product)
      click_link "Add to Cart"
      visit cart_path
      click_link "Checkout"
      click_link "Logout"
      visit '/orders/1'
      expect( page ).to_not have_content "Order Confirmation"
      expect( current_path ).to eq login_path
      expect( page ).to have_content "Must Be Logged In"
    end

    it "should have a link back to the cart review" do
      user_logs_in
      visit product_path(product)
      click_link "Add to Cart"
      visit cart_path
      click_link "Checkout"
      expect( page ).to have_link "Back to Cart"
    end

    def logged_in_user_gets_to_order_page
      user_logs_in
      visit product_path(product)
      click_link "Add to Cart"
      visit cart_path
      click_link "Checkout"
    end

    xit "should accept complete credit card info" do 
      logged_in_user_gets_to_order_page
      expect( current_path ).to eq "/orders/1"
      find(".stripe-button-el").click_button
      find("stripe-button-el").click
      expect( page.has_css?( "stripe-button-el") ).to be_true
    end

  end
  
end
