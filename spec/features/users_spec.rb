require 'spec_helper'

describe "Users" do
  describe "GET /users" do

    xit "takes you to the users page" do
      visit users_path
      expect( page ).to have_content "Listing Users"
    end

    xit "it displays a user" do
      User.create(username: "admin2")
      visit users_path
      expect( page ).to have_content "admin2"
    end

    it "displays a signup link" do
      visit login_path
      expect( page ).to have_link "Sign Up"
    end

  describe 'new user'
  def sign_up_tom
    visit new_user_path
    fill_in 'user_username', :with => "Tom Smith"
    fill_in 'user_display_name', :with => "Tom"
    fill_in 'user_email', :with => "tom@tom.com"
    fill_in 'user_password', :with => "tom"
    fill_in 'user_password_confirmation', :with => "tom"
    click_button "Create User"
  end

    xit "has a valid display name" do
      sign_up_tom
      expect( page ).to have_content "Username: Tom Smith"
    end

    xit "has an invalid display name (too short)" do
      visit new_user_path
      fill_in 'user_username', :with => "Tom Smith"
      fill_in 'user_display_name', :with => "B"
      fill_in 'user_email', :with => "tom@tom.com"
      fill_in 'user_password', :with => "tom"
      fill_in 'user_password_confirmation', :with => "tom"
      click_button "Create User"
      expect( page ).to have_content "Display name is too short"
    end

    xit "has an invalid display name (too long)" do
      visit new_user_path
      fill_in 'user_username', :with => "Tom Smith"
      fill_in 'user_display_name', :with => "tomsmithtomsmithtomsmithtomsmithtomsmithtomsmith"
      fill_in 'user_email', :with => "tom@tom.com"
      fill_in 'user_password', :with => "tom"
      fill_in 'user_password_confirmation', :with => "tom"
      click_button "Create User"
      expect( page ).to have_content "Display name is too long"
    end

    xit "has a invalid email (duplicate emails)" do
      sign_up_tom
      expect( page ).to have_content "Username: Tom Smith"
      click_link "Logout"
      sign_up_tom
      expect( current_path ).to eq users_path
      expect( page ).to have_content "Email has already been taken"
    end

  end

end
