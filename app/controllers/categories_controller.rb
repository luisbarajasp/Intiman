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
      @cloths = @category.cloths.order("#{params[:sort] or 'created_at'} #{params[:order] or 'DESC'}").paginate(:page => params[:page], :per_page => 20)

      @cloths = @cloths.select { |c| c.sizes_n.include? params[:size] } if params[:size]
      @cloths = @cloths.where('brand_n = ?', params[:brand]) if params[:brand]
      @cloths = @cloths.select { |c| c.colors_n.include? params[:color] } if params[:color]
      @cloths = @cloths.where('price < ?', params[:price]) if params[:price]
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
