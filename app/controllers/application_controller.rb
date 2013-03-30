class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :shopping_cart, :only => [:show, :index]
 
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
          merged_cart = session[:shopping_cart].merge(current_user.cart.data){|key,val1,val2|val1 + val2}
          current_user.cart.data = merged_cart
          current_user.cart.save
          session[:shopping_cart] = merged_cart
        end
      else
        current_user.create_cart(data: session[:shopping_cart])
      end
    end
   @shopping_cart = session[:shopping_cart].collect{|k,v| [Product.find(k), v]}.reject{|product,count| count < 1}
  end

end
