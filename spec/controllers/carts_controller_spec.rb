require 'spec_helper'

describe CartsController do

  describe "GET #show" do
    it "renders the show template" do
      get :show
      expect( response ).to render_template :show
    end
  end

  # describe "POST #update" do
  #   describe "with valid params" do
  #     let!(:user){ User.create(:username => "admin",:email=>"admin@admin.com",
  #         :password => "admin",
  #         :salt => "asdasdastr4325234324sdfds",
  #         :crypted_password => Sorcery::CryptoProviders::BCrypt.encrypt("secret", "asdasdastr4325234324sdfds")}

  #     it "should update the cart" do
  #       page.driver.post(user_sessions_url, {:username => "admin", :password => "admin"})
  #       # Address.any_instance.stub(:save).and_return(false)
  #       # put :update, {:id => address.to_param, :address => { "full_name" => "invalid value" }}, valid_session
  #       # response.should render_template("edit")

  #       put :update, {:id => 1,:increase => 1}
  #       controller.current_user.cart.data.should eq session[:shopping_cart]
  #     end
  #   end
  # end

end
