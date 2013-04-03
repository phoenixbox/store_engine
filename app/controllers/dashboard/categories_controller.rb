class Dashboard::CategoriesController < ApplicationController
  layout 'dashboard_layout'
  before_filter :require_login

  def index
    @stats = Order.stats
    @categories = Category.all
  end

  def show
    @stats = Order.stats
    @category = Category.find(params[:id])
  end
  
  def edit
    @stats = Order.stats
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:green] = 'category was successfully updated.' 
      redirect_to dashboard_category_path(@category)
    else
      render action: "edit"
    end
  end

end
