class HomeSlidersController < ApplicationController
  def index
      @sliders = HomeSlider.all.order('created_at DESC')
  end

  def new
      @slider = HomeSlider.new
  end

  def create
      @slider = HomeSlider.new slider_params

      if @slider.save
          redirect_to root_path, notice: "Slider uploaded succesfully."
      else
          render 'new', alert: "Error: try again."
      end
  end

  def edit
      @slider = HomeSlider.find(params[:id])
  end

  def update
      @slider = HomeSlider.find(params[:id])

      respond_to do |f|
			if @slider.update(slider_params)
				f.html {redirect_to @slider, notice: "Slider updated succesfully."}
				f.json { render :show, status: :ok, location: @slider }
			else
				f.html { render :edit }
				f.json { render json: @slider.errors, status: :unprocessable_entity }
			end
		end
  end

  def destroy
      @slider = HomeSlider.find(params[:id])
      @slider.destroy

      redirect_to home_sliders_path
  end

  private

  def slider_params
      params.require(:home_slider).permit(:description,:link,:display,:image)
  end
end
