class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :shopping_cart
  before_filter :search_terms
  before_filter :page_views
 
  def page_views
    session[:page_views] ||= Hash.new(0)
    session[:total_views] ||= 0
    session[:total_views] += 1
  end
  
  def require_admin
    if current_user.admin == true
      true
    else
      flash[:red] = "Only system administrators may access this page"
      redirect_to root_path
    end
  end

  def search_terms
    @search_terms ||= Product.all.map(&:title)
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
