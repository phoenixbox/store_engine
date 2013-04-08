class ChargesController < ApplicationController
  # after_filter just_got_an_order :only => [:create]

  def new
    @order = Order.find(session[:order_id])
  end

  def create
    user = current_user
    if session[:order_id].nil?
      order = Order.for_user(user)
    else
      order = Order.find(session[:order_id])
    end
    
    if user.stripe_customer_id.nil?
      set_stripe_customer_id(params[:stripeToken],user)
    end
    charge_user(user,order)
    empty_cart
    just_got_an_order(order.subtotal) # flowdock
    redirect_to success_path

  rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end


private

  def just_got_an_order(the_flow)
    flow = Flowdock::Flow.new(
      :api_token => "3f362c1e1985fcae9bf587ff1451232c",
      :external_user_name => "PooPoo")

      # send message to Chat
    flow.push_to_chat(
      :content => "Hey there!")
  end

  def charge_user(user,order)
    charge = Stripe::Charge.create(
      :customer    => user.stripe_customer_id,
      :amount      => order.subtotal,
      :description => "HCD Order_ID #{order.id}",
      :currency    => 'usd'
    )
    order.status = "paid"
    order.save!
  end

  def empty_cart
    session[:shopping_cart] = Hash.new(0)
    current_user.cart.data = Hash.new(0)
    current_user.cart.save!
  end

  def set_stripe_customer_id(token,user)
    customer = Stripe::Customer.create(
    :email => current_user.email,
    :card  => token)
    user.stripe_customer_id = customer.id
    user.save!
  end

end
