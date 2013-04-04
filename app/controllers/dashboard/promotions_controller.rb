class Dashboard::PromotionsController < ApplicationController
  before_filter :require_admin
  before_filter :stats
  layout 'dashboard_layout'

  def index
    @promotions = Promotion.all
  end

  def show
    @promotion = Promotion.find(params[:id])
  end

  def new
    @promotion = Promotion.new(product_id: params[:id])
  end

  def create
    @promotion = Promotion.new(params[:promotion])
    if @promotion.save
      redirect_to dashboard_promotions_path
    else
      render action: "new"
    end
  end

  def edit
    @promotion = Promotion.find(params[:id])
  end

  def update
    @promotion = Promotion.find(params[:id])
    if @promotion.update_attributes(params[:promotion])
      redirect_to dashboard_promotions_path
    else
      render action: "edit"
    end
  end

  def destroy
    promotion = Promotion.find(params[:id])
    promotion.end = Date.current
    promotion.save
    redirect_to dashboard_promotions_path
  end

  def stats
    @stats = Order.stats
  end
end
