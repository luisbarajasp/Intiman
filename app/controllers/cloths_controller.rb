class ClothsController < ApplicationController
  def index
      @cloths = Cloth.all.order('created_at DESC')
  end

  def show
      @cloth = Cloth.find(params[:id])
  end

  def new
      @cloth = Cloth.new
      @categories =  Category.all.order('created_at ASC')
      @brands =  Brand.all.order('created_at ASC')

  end

  def create
      @cloth = Cloth.new cloth_params

      if @cloth.save
          redirect_to @cloth, notice: "Cloth uploaded succesfully."
      else
          render 'new', alert: "Error: try again."
      end
  end

  def edit
      @cloth = Cloth.find(params[:id])
  end

  def update
      @cloth = Cloth.find(params[:id])

      respond_to do |f|
			if @cloth.update(cloth_params)
				f.html {redirect_to @cloth, notice: "Cloth updated succesfully."}
				f.json { render :show, status: :ok, location: @cloth }
			else
				f.html { render :edit }
				f.json { render json: @cloth.errors, status: :unprocessable_entity }
			end
		end
  end

  def destroy
      @cloth = Cloth.find(params[:id])
      @cloth.destroy

      redirect_to clothes
  end

  private
  def cloth_params
      params.require(:cloth).permit(:description,:normal_price,:discount_price,:sale,:brand_id,:category_id)
  end
end
