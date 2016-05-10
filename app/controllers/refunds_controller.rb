class RefundsController < ApplicationController
  def refund
      @order = Order.find(params[:id])

      puts @order.charge_id


      if @order.order_status_id == 2
          Stripe.api_key = ENV["STRIPE_API_KEY"]

          re = Stripe::Refund.create(
              charge: @order.charge_id
            )

          @order.update_attribute(:order_status_id, 4)

          redirect_to user_orders_path, notice: "Reembolso solicitado."
      else
          flash[:alert] = "Sólo se puede solicitar reembolso de las órdenes que se encuentren con status de pagadas y aún no se han enviado"
      end
  end
end
