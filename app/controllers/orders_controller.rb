class OrdersController < ApplicationController

  def show
    order = Order.find(params[:id])
    if logged_in? && order.user_id == current_user.id
      @order = order
    else
      flash[:red] = "Access Denied"
      redirect_to root_path
    end
  end

end
