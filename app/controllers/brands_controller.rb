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
        @brand = Brand.find(params[:id])
    end
    def destroy
        @brand = Brand.find(params[:id])
        @brand.destroy

        redirect_to brands_path
    end

    private

    def brand_params
        params.require(:brand).permit(:name)
    end
end
