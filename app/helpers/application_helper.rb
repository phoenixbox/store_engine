module ApplicationHelper

  def logo
    link_to root_path, class:"logo pull-left" do
      image_tag('logo_reduced.png' )
    end   
  end

  def quick_pay
    if logged_in?
      if current_user.stripe_customer_id.nil?
        checkout
      else
        returning_customer
      end
    else
      checkout
    end
  end

  def returning_customer
    link_to "QuickPay",charges_path, method:"post",confirm:"DO IT NOW!", class:"btn btn-primary btn-block"
  end

  def checkout
    link_to "Checkout",orders_path, method:"post", class:"btn btn-warning btn-block"
  end
  
end
