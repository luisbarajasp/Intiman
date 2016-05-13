class AdminOrdersController < ApplicationController
    before_action :authenticate_admin!

  def show
      @order = Order.find(params[:id])
  end
  def edit
      @order = Order.find(params[:id])
  end
  def update
      @order = Order.find(params[:id])

      respond_to do |f|
			if @order.update(order_params)
				f.html {redirect_to @order, notice: "Order updated succesfully."}
				f.json { render :show, status: :ok, location: @order }
			else
				f.html { render :edit }
				f.json { render json: @order.errors, status: :unprocessable_entity }
			end
		end
  end
  def buyed
      @order = Order.where(order_status_id: 2)
  end
  def shipped
      @order = Order.where(order_status_id: 3)
  end
  def cancelled
      @order = Order.where(order_status_id: 4)
  end

  private
  def order_params
      params.require(:order).permit(:order_status_id)
  end
end
