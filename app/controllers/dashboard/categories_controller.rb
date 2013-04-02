class Dashboard::CategoriesController < ApplicationController
  layout 'dashboard_layout'

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
  end

end
