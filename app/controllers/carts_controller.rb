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
    if logged_in?
      current_user.cart.data = session[:shopping_cart]
      current_user.cart.save
    end
    redirect_to :back
  end

  def confirmation
    if logged_in?
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

    else
      flash[:red] = "Please Login, Cannot purchase without logging in."
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
