class OrdersController < ApplicationController
    before_action :authenticate!
    before_action :authenticate_admin!, except: [:show]
    def show
        @order = Order.find(params[:id])
        if user_signed_in? && current_user != @order.user
            redirect_to root_path
        end
        if admin_signed_in?
            @notification = ANotification.where("admin_id = ? AND order_id = ?", current_admin.id, @order.id).unread.first

            if @notification
                @notification.update_attribute(:read_at, Time.now.in_time_zone)
            end
        end
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

                @notifications = ANotification.where(order: @order).unread

                @notifications.each do |notification|
                    notification.update_attribute(:read_at, Time.now.in_time_zone)
                end

  			else
  				f.html { render :edit }
  				f.json { render json: @order.errors, status: :unprocessable_entity }
  			end
  		end
    end

  private
    def order_params
        params.require(:order).permit(:order_status_id,:tracking)
    end
end
