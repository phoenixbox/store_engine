class ChargesController < ApplicationController

  def new
    @order = Order.find(session[:order_id])
  end

  def create
    if session[:order_id].nil?
      confirmation
    end
    order = Order.find(session[:order_id])
    # Amount in cents
    @amount = order.subtotal

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    order.status = :paid
    order.save!
    session[:shopping_cart] = Hash.new(0)
    current_user.cart.data = Hash.new(0)
    current_user.cart.save! 
    redirect_to success_path

  rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end


  def confirmation
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
    session[:order_id] = order.id
  end

end
