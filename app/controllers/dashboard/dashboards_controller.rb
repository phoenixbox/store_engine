class Dashboard::DashboardsController < ApplicationController
  layout 'dashboard_layout'
  before_filter :require_admin

  def show
    @stats = Order.stats
    if params[:sort]
      @orders = Order.search(params[:sort])
    else
      @orders = Order.all
    end
  end


  
end
