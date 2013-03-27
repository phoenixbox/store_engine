class CartsController < ApplicationController
#before confirmation
#confirm user is logged in.
  def show
  end

  def update
    product = Product.find(params[:id])
    remove(product.id) if params[:remove] == "true"
    increase(product.id,params[:increase].to_i) if params[:increase].to_i > 0
    decrease(product.id,params[:decrease].to_i) if params[:decrease].to_i > 0
    redirect_to :back
  end

  def confirmation
    if logged_in?
      @user = current_user
    else
      redirect_back_or_to(login_path)
    end
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
