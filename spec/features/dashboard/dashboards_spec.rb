require 'spec_helper'

describe "Dashboard" do 

  context "views" do 

    let!(:product) { Product.create(title:"product title", description: "product description", price: 12345) }

    let!(:admin) {User.create(email: "admin@admin.com", username: "admin", 
      password: "admin", password_confirmation: "admin", admin: 1)}

    let!(:user) {User.create(email: "user@user.com", username: "user", password: "user", password_confirmation: "user", admin: 0)}

    def login_admin
      visit login_path
      fill_in 'username', :with => "admin@admin.com"
      fill_in 'password', :with => "admin"
      click_button "Login"
    end

    def login_user
      visit login_path
      fill_in 'username', :with => "user@user.com"
      fill_in 'password', :with => "user"
      click_button "Login"
    end

    xit "dashboard link should be visible to an admin" do 
      login_admin
      visit root_path
      expect( page ).to have_button_or_link 'Dashboard'
    end


    xit "dashboard link should not be visible to non-admin user" do 
      login_user
      visit root_path
      expect( page ).to_not have_link 'Dashboard'
    end

     xit "dashboard link should link to the dashboard" do 
      login_admin
      visit root_path
      click_link "Dashboard"
      expect( current_path ).to eq dashboard_root_path
      # expect( page.has_css?('div#cart_confirmation') )
      # expect( page.has_css?('table#dashboard') )
    end

    xit "should link to products page" do
      login_admin
      visit root_path
      click_link "Dashboard"
      click_link "Products"
      expect( current_path ).to eq dashboard_products_path
    end

   xit "should link to categories page" do
      login_admin
      visit root_path
      click_link "Dashboard"
      click_link "Categories"
      expect( current_path ).to eq dashboard_categories_path
    end    

    


  end

end
