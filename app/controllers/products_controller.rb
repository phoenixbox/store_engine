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

  def landing_page # put any product or category into the panel items that you want to display on the view
    panel_items = []
    # panel_items << Category.find(1)
    panel_items << Product.find(1)
    # panel_items << Product.find(50)
    # panel_items << Product.find(100)
    @panel_items = panel_items
  end

end
