class OrdersController < ApplicationController
  before_filter :require_login
  def index
    @orders = current_user.orders
  end

  def show #how do we redirect when an unauthorized order is requested?
    order = Order.find(params[:id])
    if order != nil && (order.user_id == current_user.id)
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

  def create
    order = Order.for_user(current_user)
    session[:order_id] = order.id
    redirect_to order_path(order)
  end

  def require_login
    if !logged_in?
      flash[:red] = "Must Be Logged In ;)"
      redirect_to login_path
    end
  end

end

