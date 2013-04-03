class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :shopping_cart, :only => [:show, :index, :new, :edit]
 
  def require_admin
    if current_user.admin == true
      true
    else
      flash[:red] = "Only system administrators may access this page"
      redirect_to login_path
    end
  end

  private
 
  def shopping_cart
    session[:shopping_cart] ||= Hash.new(0)
    if logged_in?
      if current_user.cart
        unless session[:shopping_cart] == current_user.cart.data
          session[:shopping_cart] = current_user.cart.data.merge(session[:shopping_cart])
          current_user.cart.update_attributes(data: session[:shopping_cart])
        end
      else
        current_user.create_cart(data: session[:shopping_cart])
      end
    end
   @shopping_cart = session[:shopping_cart].collect{|k,v| [Product.find(k), v]}
  end

end
