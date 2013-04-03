class Dashboard::ProductsController < ApplicationController
  before_filter :require_admin
  layout 'dashboard_layout'
  
  def index
    @stats = Order.stats
    @products = Product.all
  end

  def show
    @stats = Order.stats
    @product = Product.find(params[:id])
  end

  def new
    @stats = Order.stats
    @product = Product.new
  end

  def create
    @product = Product.create(params[:product])
    if @product.save
      flash[:green] = "#{@product.title} is for Sale!"
      redirect_to dashboard_product_path(@product)
    else
      flash[:red] = "fix stuff"
      redirect_to :back  
    end
  end

  def edit
    @stats = Order.stats
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(params[:product])
    flash[:yellow] = "#{@product.title} has been updated!!"
    redirect_to dashboard_product_path(@product)
  end

  def vizzi_flip  #Retiring Products
    product = Product.find(params[:id])
    if product.visible == true
      flash[:red] = "Turned Off"
      product.update_attribute(:visible, false)
    else
      flash[:green] = "Turned On"
      product.update_attribute(:visible, true)
    end
    redirect_to :back
  end

  def import
    Product.import(params[:file])
    redirect_to dashboard_products_path, notice: "Products imported."
  end

end
