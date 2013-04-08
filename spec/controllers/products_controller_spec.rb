require 'spec_helper'

describe ProductsController do 

  describe 'GET #index' do 
      let!(:products) { [ Product.create!(title:"product title", long_description: "product description", price: 12345, cost_cents: 6000, page_views:0,visible:true ) ] }

    it "populates an array of products" do 
      get :index
      expect( assigns(:products) ).to match_array products
    end
  end

  describe 'GET #show' do
    let!(:product) { Product.create(title:"product title", description: "product description", price: 12345, cost_cents:6000) }

    it "finds a product" do
      get :show, id: product.id
      expect( assigns(:product) ).to eq product
    end
  end

  describe 'GET #panel_items' do
    let!(:product) { Product.create(title:"product title", long_description: "product description", price: 12345) }

    xit "finds a product" do
      product = Product.create(title:"product title", long_description: "product description", price: 12345)
      product.stub(:discount).and_return(20)
      get :landing_page
      expect( assigns(:panel_items) ).to be
    end
  end
end
