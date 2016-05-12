class PromotionsController < ApplicationController
  before_action :authenticate_admin!, :except => [:show]

  def show
      @promotion = Promotion.find(params[:id])
      @cloths = @promotion.cloths.order( "#{params[:sort] or 'created_at'} #{params[:order] or 'DESC'}")

      @cloths = @cloths.select { |c| c.sizes_n.include? params[:size] } if params[:size]
      @cloths = @cloths.where('brand_n = ?', params[:brand]) if params[:brand]
      @cloths = @cloths.where('category_n = ?', params[:category]) if params[:category]
      @cloths = @cloths.select { |c| c.colors_n.include? params[:color] } if params[:color]
      @cloths = @cloths.where('price < ?', params[:price]) if params[:price]
  end

  def edit
      @promotion = Promotion.find(params[:id])
  end

  def update
      @promotion = Promotion.find(params[:id])

      respond_to do |f|
			if @promotion.update(promotion_params)
				f.html {redirect_to @promotion, notice: "Promotion updated succesfully."}
				f.json { render :show, status: :ok, location: @promotion }
			else
				f.html { render :edit }
				f.json { render json: @promotion.errors, status: :unprocessable_entity }
			end
		end
  end

  def new
      @promotion = Promotion.new
  end

  def create
      @promotion = Promotion.new promotion_params

      if @promotion.save
          redirect_to @promotion, notice: "Promotion uploaded succesfully."
      else
          render 'new', alert: "Error: try again."
      end
  end

  def destroy
      @promotion = Promotion.find(params[:id])
      @promotion.destroy

      redirect_to promotions_path
  end

  private

  def promotion_params
      params.require(:promotion).permit(:title,:description,:show,{:cloth_ids => []})
  end
end
