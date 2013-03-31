class ProductsController < ApplicationController
  
  def index
    @products = Product.where(:visible => true).shuffle[0..20]
  end

  def show
    @product = Product.find(params[:id])
  end

end
