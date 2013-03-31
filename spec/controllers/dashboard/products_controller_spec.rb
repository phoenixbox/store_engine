require 'spec_helper'

describe Dashboard::ProductsController do
  
describe 'GET #new' do
    let!(:product) { Product.create(title:"product title", description: "product description", price: "12.34") }

    it "finds a product" do
      get :new
      expect( response ).to render_template :new
    end
  end

  describe 'GET #create' do
    let!(:product) { Product.create(title:"product title", description: "product description", price: "12.34") }

    it "finds a product" do
      get :new
      expect( response ).to render_template :new
    end
  end

  describe 'GET #edit' do
    let!(:product) { Product.create(title:"product title", description: "product description", price: "12.34") }

    it "finds a product" do
      get :edit, id: product.id
      expect( assigns(:product) ).to eq product
    end
  end  

end
