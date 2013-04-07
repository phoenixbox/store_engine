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
    session[:page_views][@product.id] += 1
    @product.increase_view_count
  end

  def landing_page
    @panel_items = Product.landing_page || []
    @recently_viewed = session[:page_views].map{|k,v| [Product.find(k), v]}
  end

end
