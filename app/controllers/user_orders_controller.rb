class UserOrdersController < ApplicationController
    before_action :authenticate_user!
  # def index
  #     @orders = Order.where(user_id: current_user.id)
  # end

  def edit
      @address = ""
      @suburb = ""
      @cp = ""
      @city = ""
      @state = ""
      if current_order.order_items.count > 0
          @order = Order.find(current_order.id)
          @order_items = current_order.order_items
          @orders = Order.where(user_id: current_user.id)
          @repeated = false
          @order_p = Order.where('user_id = ? AND order_status_id != 1 AND address IS NOT NULL',current_user.id).order('created_at DESC').first

          if @order_p
              @repeated = true
              @address = @order_p.address
              @suburb = @order_p.suburb
              @cp = @order_p.cp
              @city = @order_p.city
              @state = @order_p.state
          end

        #   @orders.each do |order|
        #       if order != current_order && !order.address.nil?
        #            @repeated = true
        #            @address = order.address
        #            @suburb = order.suburb
        #            @cp = order.cp
        #            @city = order.city
        #            @state = order.state
        #       end
        #   end
      else
          redirect_to root_path, alert: "No tienes prendas en tu carrito de compras."
      end
  end

  def update
      @order = Order.find(current_order.id)

      Stripe.api_key = ENV["STRIPE_API_KEY"]

      if current_user.customer_id.nil?
          # Get the credit card details submitted by the form
          token = params[:stripeToken]

          begin
              # Create a Customer
              customer = Stripe::Customer.create(
                  :source => token,
                  :description => current_user.name,
                  :email => current_user.email
              )

              # Charge the Customer instead of the card
              charge = Stripe::Charge.create(
                  :amount => (@order.total * 100).floor, # in cents
                  :currency => "mxn",
                  :customer => customer.id
              )

              current_user.update_attribute(:customer_id, customer.id)

              @order.update_attribute(:order_status_id, 2)
              @order.update_attribute(:sold_at, Time.now.in_time_zone)

              flash[:notice] = "Tu compra fue realizada satisfactoriamente."
          rescue Stripe::CardError => e
              flash[:alert] = e.message
          end
      else
          begin
              charge = Stripe::Charge.create(
                 :amount   => (@order.total * 100).floor, # $15.00 this time
                 :currency => "mxn",
                 :customer => current_user.customer_id # Previously stored, then retrieved
              )

              @order.update_attribute(:order_status_id, 2)
              @order.update_attribute(:sold_at, Time.now.in_time_zone)

              flash[:notice] = "Tu compra fue realizada satisfactoriamente."
          rescue Stripe::CardError => e
              flash[:alert] = e.message
          end

      end

      respond_to do |f|
		if @order.update(order_params)
			f.html {redirect_to user_orders_path}
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
