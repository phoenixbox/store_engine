class ProductsController < ApplicationController
  
  def index
    if params[:q]
      @products = Product.where(:visible => true).search(params[:q])
    else
      @products = Product.where(:visible => true).shuffle[0..20]
    end

  end

  def show
    @product = Product.find(params[:id])
  end

end
