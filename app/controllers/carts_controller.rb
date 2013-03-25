class CartsController < ApplicationController

  def show
  end

  def update
    product = Product.find(params[:id])
    remove(product.id) if params[:remove] == "true"
    increase(product.id,params[:increase].to_i) if params[:increase].to_i > 0
    decrease(product.id,params[:decrease].to_i) if params[:decrease].to_i > 0
    redirect_to :back
  end

  private

    def decrease(id,count)
      session[:shopping_cart][id] -= count
    end

    def increase(id,count)
      session[:shopping_cart][id] += count
    end

    def remove(id)
      session[:shopping_cart][id] = 0
    end

end
