class OrdersController < ApplicationController

  def index
    if logged_in?
      @orders = current_user.orders
    else
      flash[:red] = "Please Login"
      redirect_to :login
    end
  end

  def show
    order = Order.find(params[:id])
    if logged_in? && order.user_id == current_user.id
      session[:order_id] = order.id
      @order = order
    else
      flash[:red] = "Access Denied"
      redirect_to root_path
    end
  end

  def success
    @order = Order.find(session[:order_id])
  end

end

