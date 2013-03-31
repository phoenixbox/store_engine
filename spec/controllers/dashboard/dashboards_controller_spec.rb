require 'spec_helper'

describe Dashboard::DashboardsController do

  describe "GET #show" do


    let!(:current_user) {User.create(email: "admin@admin.com", username: "admin", 
      password: "admin", password_confirmation: "admin", admin: true)}

    it "should render render dashboard layout view" do
      controller.stub(:require_admin => true)
      get :show
      expect(response).to render_template :show
    end

  end

end
