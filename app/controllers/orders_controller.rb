class OrdersController < ApplicationController
  before_filter :require_login
  def index
    @orders = current_user.orders
  end

  def show #how do we redirect when an unauthorized order is requested?
    if Order.exists?(params[:id])
      order = Order.find(params[:id])
      if order != nil && (order.user_id == current_user.id)
        session[:order_id] = order.id
        @order = order
      else
        flash[:red] = "Access Denied"
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def success
    @order = Order.find(session[:order_id])
  end

  def create
    order = current_user.orders.create(:status => :pending, :subtotal => 0)
    # for each item in the cart, find the product object, create a line_item
    current_user.cart.data.each do |item_id,quantity|
      product = Product.find(item_id)
      order.line_items.create(:product_id => product.id, :quantity => quantity, :unit_price_cents => product.price)
    end
    result = []
    order.line_items.each do |line_item|
      result << line_item.quantity * line_item.unit_price_cents
    end
    order.subtotal = result.inject(:+)
    order.save!

    redirect_to order_path(order)
  end

  def require_login
    if !logged_in?
      flash[:red] = "Must Be Logged In ;)"
      redirect_to login_path
    end
  end

end

