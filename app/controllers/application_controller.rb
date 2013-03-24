class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :shopping_cart, :only => [:show, :index]
 
  private
 
  def shopping_cart
    session[:shopping_cart] ||= Hash.new(0)
    @shopping_cart = session[:shopping_cart].collect{|k,v| [Product.find(k), v]}.reject{|product,count| count < 1} 
  end

end
