class ProductsController < ApplicationController
  
  def index
    if params[:q]
      @products = Product.where(:visible => true).search(params[:q])
    else
      @products = Product.where(:visible => true)
    end

  end

  def show
    @product = Product.find(params[:id])
  end

  def landing_page
    @panel_items = Product.landing_page
  end


end
