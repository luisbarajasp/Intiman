class AdminOrdersController < ApplicationController
    before_action :authenticate_admin!
  def buyed
      @order = Order.where(order_status_id: 2)
  end
  def shipped
      @order = Order.where(order_status_id: 3)
  end
  def cancelled
      @order = Order.where(order_status_id: 4)
  end
end
