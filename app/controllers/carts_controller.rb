class CartsController < ApplicationController

  def add_to_cart
    product = Product.find(params[:id])
    session[:shopping_cart][product.id] += 1
    redirect_to(:back)
  end

  def decrease_count
    product = Product.find(params[:id])
    session[:shopping_cart][product.id] -= 1
    redirect_to(:back)
  end

end
