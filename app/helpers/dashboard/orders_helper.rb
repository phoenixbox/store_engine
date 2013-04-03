module Dashboard::OrdersHelper

  def update_order(order)
    if order.status == "pending"
      link_to "Cancel Order?", dashboard_order_path(order, status:"cancelled"), :method => "put", class:"btn btn-warning"
    elsif order.status == "shipped"
      link_to "Mark as Returned?", dashboard_order_path(order, status:"returned"), :method => "put", class:"btn btn-warning"
    elsif order.status == "paid"
      link_to "Mark as Shipped", dashboard_order_path(order, status:"shipped"), :method => "put", class:"btn btn-warning"
    else
      link_to "Re-Ship???", "#", class:"btn btn-warning"
    end 
  end
end
