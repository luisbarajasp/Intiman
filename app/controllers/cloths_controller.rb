class ClothsController < ApplicationController
  before_action :authenticate_admin!, except: [:show, :like, :unlike]
  before_action :authenticate_user!, only: [:like,:unlike]
  def index
      @cloths = Cloth.all.order('created_at DESC')
  end

  def show
      @cloth = Cloth.find(params[:id])
      @cloths = Cloth.where('category_id = ? AND id != ?', @cloth.category_id, @cloth.id).limit(5)
      @order_item = current_order.order_items.new
      @sizes = Size.all.order('created_at ASC')
      @sis = @cloth.sis
      @cos = @cloth.cos
  end

  def new
      @cloth = Cloth.new
      @categories =  Category.all.order('created_at ASC')
      @brands =  Brand.all.order('created_at ASC')
  end

  def create
      @cloth = Cloth.new cloth_params
      @cloth.category_n = @cloth.category.name
      @cloth.brand_n = @cloth.brand.name

      tmp = Array.new
      tmp2 = Array.new


      @cos = @cloth.cos
      @cos.each do |co|
          @color = co.color.name
          tmp<<@color
      end

       @cloth.colors_n = tmp

       @sis = @cloth.sis
       @sis.each do |si|
           @size = si.size.letter
           tmp2<<@size
       end

       @cloth.sizes_n = tmp2


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
      @cloth.category_n = @cloth.category.name
      @cloth.brand_n = @cloth.brand.name

      tmp = Array.new
      tmp2 = Array.new


      @cos = @cloth.cos
      @cos.each do |co|
          @color = co.color.name
          tmp<<@color
      end

      @cloth.colors_n = tmp

      @sis = @cloth.sis
      @sis.each do |si|
          @size = si.size.letter
          tmp2<<@size
      end

      @cloth.sizes_n = tmp2

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

      redirect_to cloths_path
  end

  def like
    @cloth = Cloth.find(params[:id])
    @cloth.liked_by current_user

    redirect_to :back

 end

 def unlike
    @cloth = Cloth.find(params[:id])
    @cloth.unliked_by current_user

    redirect_to :back
 end

  private
  def cloth_params
      params.require(:cloth).permit(:description,:normal_price,:discount_price,:brand_id,:category_id,
      {:size_ids => []},{:color_ids => []},:image1, :image2
      #,{:sizes => []},{:colors => []}
      )
  end
end
