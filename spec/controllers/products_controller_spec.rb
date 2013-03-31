require 'spec_helper'

describe ProductsController do 

  describe 'GET #index' do 
      let!(:products) { [ Product.create(title:"producttitle", description: "product description", price: "12.34") ] }

    it "populates an array of products" do 
      get :index
      expect( assigns(:products) ).to match_array products
    end
  end

  describe 'GET #show' do
    let!(:product) { Product.create(title:"product title", description: "product description", price: "12.34") }

    it "finds a product" do
      get :show, id: product.id
      expect( assigns(:product) ).to eq product
    end
  end
end
