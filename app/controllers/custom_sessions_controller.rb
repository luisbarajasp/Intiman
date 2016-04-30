class CustomSessionsController < Devise::SessionsController

  before_filter :before_login, :only => :new
  after_filter :after_login, :only => :create

  def before_login
      $id_cart = 0
      if current_order.order_items.count > 0
          $id_cart = current_order.id
      end
  end

  def after_login
      if $id_cart != 0
          @p_order = Order.find($id_cart)
          @p_order.order_items.each do |order_item|
              order_item.order = current_order
              order_item.update_attribute(:order_id, current_order.id)
              current_order.save
          end
      end
  end

end
