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

  def landing_page # put any product or category into the panel items that you want to display on the view
    panel_items = []
    panel_items << Product.find_by_model_number("LBG-01165")
    # panel_items << Product.find.limit(3)
    panel_items << Product.find_by_model_number("LBG-01165")
    panel_items << Product.find_by_model_number("SFT-01764")
    @panel_items = panel_items
  end

end
