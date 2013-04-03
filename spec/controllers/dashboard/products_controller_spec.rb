require 'spec_helper'

describe Dashboard::ProductsController do
  
describe 'GET #new' do
    let!(:product) { Product.create(title:"product title", description: "product description", price: "12.34") }

    xit "finds a product" do
      get :new
      expect( response ).to render_template :new
    end
  end

  describe 'GET #create' do

    xit 'creates the new product' do
      post :create, { product: {title:"product title", description: "product description", price: 1234} }
      expect(Product.last.title).to eq 'product title'
      expect(Product.count).to eq 1
    end

    xit 'does not create new product' do
      request.env["HTTP_REFERER"] = dashboard_products_path
      expect {
        post :create, 
        product: {title: nil}
        }.to_not change(Product, :count)
    end

  end

  describe 'GET #edit' do
    let!(:product) { Product.create(title:"product title", description: "product description", price: "12.34") }

    xit "finds a product" do
      get :edit, id: product.id
      expect( assigns(:product) ).to eq product
    end
  end

  describe '#destroy' do
    let!(:product) { Product.create(title:"product title", description: "product description", price: "12.34", visible: true) }
    let!(:product2) { Product.create(title:"product title", description: "product description", price: "12.34", visible: false) }

    xit "should retire visible product" do
       request.env["HTTP_REFERER"] = dashboard_products_path
       post :vizzi_flip, id: product.id
       retired_product = Product.find(product.id)
       expect(retired_product).to_not be_visible
       expect( response).to redirect_to dashboard_products_path
    end

    xit "should reactivate a retired product" do
       request.env["HTTP_REFERER"] = dashboard_products_path
       post :vizzi_flip, id: product2.id
       retired_product = Product.find(product.id)
       expect( retired_product ).to be_visible
       expect( response ).to redirect_to dashboard_products_path
    end
  end  

end
