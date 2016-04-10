class SizesController < ApplicationController
  def index
      @sizes = Size.all.order('created_at ASC')
  end

  def new
      @size = Size.new
  end

  def create
      @size = Size.new size_params

      if @size.save
          redirect_to @size, notice: "Size uploaded succesfully."
      else
          render 'new', alert: "Error: try again."
      end
  end

  def show
      @size = Size.find(params[:id])
  end

  def destroy
      @size = Size.find(params[:id])
      @size.destroy

      redirect_to sizes_path
  end

  private
  def size_params
      params.require(:size).permit(:letter)
  end
end
