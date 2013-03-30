class Dashboard::DashboardsController < ApplicationController
  before_filter :require_admin

  def show
    @orders = Order.all
  end
  
end
