class Dashboard::LineItemsController < ApplicationController
  before_filter :require_login

  def update
    line_item = LineItem.find(params[:id])
    remove(line_item) if params[:destroy] == "true"
    increase(line_item,params[:up].to_i) if params[:up].to_i > 0
    decrease(line_item,params[:down].to_i) if params[:down].to_i > 0
    redirect_to :back
  end

  private
    def decrease(line_item,count)
      line_item.quantity -= count
      line_item.destroy if line_item.quantity < 1
      line_item.save
    end

    def increase(line_item,count)
      line_item.quantity += count
      line_item.save
    end

    def remove(line_item)
      line_item.destroy
    end
end
