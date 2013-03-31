class Dashboard::OrdersController < ApplicationController
  before_filter :require_admin
  layout 'dashboard_layout'

  def show
    @order = Order.find(params[:id])
  end

end
