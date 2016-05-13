class BrandsController < ApplicationController
    before_action :authenticate_admin!, only: [:new,:create,:destroy]

    def index
        @brands = Brand.all.order('created_at ASC')
    end
    def new
        @brand = Brand.new
    end
    def create
        @brand = Brand.new brand_params

        if @brand.save
            redirect_to @brand, notice: "Brand uploaded succesfully."
        else
            render 'new', alert: "Error: try again."
        end
    end
    def show
        @brand = Brand.friendly.find(params[:id])
        @cloths = @brand.cloths.order("#{params[:sort] or 'created_at'} #{params[:order] or 'DESC'}").paginate(:page => params[:page], :per_page => 20)

        @cloths = @cloths.select { |c| c.sizes_n.include? params[:size] } if params[:size]
        @cloths = @cloths.where('category_n = ?', params[:category]) if params[:category]
        @cloths = @cloths.select { |c| c.colors_n.include? params[:color] } if params[:color]
        @cloths = @cloths.where('price < ?', params[:price]) if params[:price]
    end
    def destroy
        @brand = Brand.friendly.find(params[:id])
        @brand.destroy

        redirect_to brands_path
    end

    private

    def brand_params
        params.require(:brand).permit(:name)
    end
end
