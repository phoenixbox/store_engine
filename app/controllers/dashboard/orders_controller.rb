class Dashboard::OrdersController < ApplicationController
  before_filter :require_admin

  def show
    @order = Order.find(params[:id])
  end

end
