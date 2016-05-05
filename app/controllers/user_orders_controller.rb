class UserOrdersController < ApplicationController
    before_action :authenticate_user!
  def index
      @orders = Order.where(user_id: current_user.id)
  end

  def edit
      if current_order.order_items.count > 0
          @order = Order.find(current_order.id)
          @order_items = current_order.order_items
          @orders = Order.all
          @repeated = false
          @orders.each do |order|
              if order.user == current_user && order != current_order && !order.address.nil?
                   @repeated = true
                   @address = order.address
                   @suburb = order.suburb
                   @cp = order.cp
                   @city = order.city
                   @state = order.state
              end
          end
      else
          redirect_to root_path, alert: "No tienes prendas en tu carrito de compras."
      end
  end

  def update
      @order = Order.find(current_order.id)

    #   unless params[:address].present?
    #     @order.errors.add(:address, "Es necesario que ingreses la dirección a la que se enviará la prenda")
    #   end

    #   unless params[:suburb].present?
    #     @order.errors.add(:suburb, "Es necesario que ingreses la colonia a la que se enviará la prenda")
    #   end

    #   unless params[:cp].present?
    #     @order.errors.add(:cp, "Es necesario que ingreses el código postal al que se enviará la prenda")
    #   end

    #   unless params[:city].present?
    #     @order.errors.add(:city, "Es necesario que ingreses la ciudad a la que se enviará la prenda")
    #   end

    #   unless params[:state].present?
    #     @order.errors.add(:state, "Es necesario que ingreses el estado al que se enviará la prenda")
    #   end

      @order.update_attribute(:order_status_id, 2)


      respond_to do |f|
		if @order.update(order_params)
			f.html {redirect_to user_orders_path, notice: "Tu compra fue realizada satisfactoriamente."}
			f.json { render :show, status: :ok, location: @order }
		else
			f.html { render :edit }
			f.json { render json: @order.errors, status: :unprocessable_entity }
		end
	end
  end

  private

  def order_params
      params.require(:order).permit(:address,:suburb,:cp,:city,:state)
  end
end
