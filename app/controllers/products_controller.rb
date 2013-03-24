class ProductsController < ApplicationController
  def index
    @products = Product.all  
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(params[:product])
    flash[:create] = "#{@product.title} is for Sale!"
    redirect_to product_path(@product)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(params[:product])
    flash[:update] = "#{@product} has been updated!!"
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:destroy] = "Destroyed product:#{@product.title}"
    redirect_to products_path
  end

end
