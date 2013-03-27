require 'spec_helper'

describe "Users" do
  describe "GET /users" do

    it "takes you to the users page" do
      visit users_path
      expect( page ).to have_content "Listing Users"
    end

    it "it displays a user" do
      User.create(username: "admin2")
      visit users_path
      expect( page ).to have_content "admin2"
    end

    it "displays a signup link" do
      visit login_path
      expect( page ).to have_link "Sign Up"
    end

  end

end
