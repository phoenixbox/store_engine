class Dashboard::OrdersController < ApplicationController
  before_filter :require_admin
  layout 'dashboard_layout'

  def show
    @stats = Order.stats
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update_attributes(status: params[:status])
    redirect_to :back
  end

end
