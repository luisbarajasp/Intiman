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
  def edit
      @category = Category.friendly.find(params[:id])
  end
  def update
      @category = Category.friendly.find(params[:id])
      respond_to do |f|
			if @category.update(category_params)
				f.html {redirect_to @category, notice: "Cloth updated succesfully."}
				f.json { render :show, status: :ok, location: @category }
			else
				f.html { render :edit }
				f.json { render json: @category.errors, status: :unprocessable_entity }
			end
		end
  end
  def show
      @category = Category.friendly.find(params[:id])
  end
  def destroy
      @category = Category.friendly.find(params[:id])
      @category.destroy

      redirect_to categories_path
  end

  private

  def category_params
      params.require(:category).permit(:name,:singular)
  end
end
