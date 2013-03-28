require 'spec_helper'

describe "orders page" do

  context "shows current order" do

    def user_logs_in
      visit login_path
      fill_in "username", :with => "admin"
      fill_in "password", :with => "admin"
      click_button "Login"
    end

    let!(:product) { Product.create(title: "ironing board", price: "100.12", description:"we do ironing boards well", :categories_list => "laundry") }
    let!(:user) { User.create(email:"admin@admin.com", username:"admin", password:"admin", password_confirmation:"admin")}

    it "should include the items" do
      user_logs_in
      visit product_path(product)
      click_link "Add to Cart"
      visit cart_path
      click_link "Checkout"
      expect( current_path ).to eq '/orders/1'
    end

    xit "should include the item subtotals" do

    end

    xit "should include the order subtotal" do

    end

  end
  
end
