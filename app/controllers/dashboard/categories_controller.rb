class Dashboard::CategoriesController < ApplicationController
  layout 'dashboard_layout'

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
  
  def edit
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

  def create
  end

end
