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

  describe 'DELETE #destroy' do
    let!(:product) { Product.create(title:"product title", description: "product description", price: "12.34") }

    it "deletes a product" do
      before_count = Product.all.count
      delete :destroy, id: product.id
      after_count = Product.all.count
      expect( after_count ).to eq before_count - 1
    end

    it "redirects to products index" 
  end

end
