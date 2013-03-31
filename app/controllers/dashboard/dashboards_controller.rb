class Dashboard::DashboardsController < ApplicationController
  layout 'dashboard_layout'
  before_filter :require_admin

  def show
    @orders = Order.all
  end


  
end
