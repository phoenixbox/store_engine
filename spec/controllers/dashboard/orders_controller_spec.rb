require 'spec_helper'

describe Dashboard::OrdersController do
    let!(:order){Order.create(status:"pending",subtotal:1234)}
  describe "GET #show" do 
    it "shows a product" do 
      get :show, id: 1
      expect( response ).to render_template :show
    end
  end
end
