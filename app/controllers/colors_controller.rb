class ColorsController < ApplicationController
    def index
        @colors = Color.all.order('created_at ASC')
    end

    def new
        @color = Color.new
    end

    def create
        @color = Color.new color_params

        if @color.save
            redirect_to @color, notice: "Color uploaded succesfully."
        else
            render 'new', alert: "Error: try again."
        end
    end

    def show
        @color = Color.find(params[:id])
    end

    def edit
        @color = Color.find(params[:id])
    end

    def update
        @color = Color.find(params[:id])

        respond_to do |f|
  			if @color.update(color_params)
  				f.html {redirect_to @color, notice: "Color updated succesfully."}
  				f.json { render :show, status: :ok, location: @color }
  			else
  				f.html { render :edit }
  				f.json { render json: @color.errors, status: :unprocessable_entity }
  			end
  		end
    end

    def destroy
        @color = Color.find(params[:id])
        @color.destroy

        redirect_to colors_path
    end

    private
    def color_params
        params.require(:color).permit(:name,:hex)
    end
end
