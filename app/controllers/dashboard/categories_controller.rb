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

    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:green] = 'category was successfully updated.' 
        format.html { redirect_to dashboard_category_path(@category)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

end
