class CategoriesController < ApplicationController
  before_action :authenticate_admin!, only: [:new,:create,:destroy]

  def index
      @categories = Category.all.order('created_at ASC')
  end
  def new
      @category = Category.new
  end
  def create
      @category = Category.new category_params

      if @category.save
          redirect_to @category, notice: "Category uploaded succesfully."
      else
          render 'new', alert: "Error: try again."
      end
  end
  def show
      @category = Category.find(params[:id])
  end
  def destroy
      @category = Category.find(params[:id])
      @category.destroy

      redirect_to categories_path
  end

  private

  def category_params
      params.require(:category).permit(:name)
  end
end
