require 'spec_helper'

describe Dashboard::DashboardsController do

  let!(:user) { Fabricate(:user) }

  before(:each) do
    login_user_post("admin@admin.com", "admin")
  end

  describe "GET #show" do
    xit "should render render dashboard layout view" do
      get :show
      expect(response).to render_template :show
    end

  end

end
